#!/usr/bin/env bash
# verify.sh -- VALIS Benchmarks third-party verifier
#
# Usage: ./verify.sh <version>           (e.g. ./verify.sh v1.0.0)
#        ./verify.sh <version> <wedge>   (e.g. ./verify.sh v1.0.0 phantom_precision)
#
# Handles two layouts:
#   - Legacy single-wedge: v<version>/{manifest.yaml, bundle, ots}
#   - Multi-wedge: v<version>/<wedge>/{manifest.yaml, bundle, ots}
#
# In multi-wedge mode, all wedges are verified. With a <wedge> argument, only
# that wedge is verified.
#
# CRITICAL: This script has ZERO VALIS dependencies. It must run from any clean
# environment with only standard CLI tools (cosign, ots, jq, sha256sum/shasum)
# and pull all evidence from this repository plus public anchoring services.
#
# Exit codes:
#   0 = FULL PASS (every checked wedge: signature + Rekor + OTS Bitcoin-confirmed)
#   1 = PARTIAL PASS (every checked wedge: signature + Rekor confirmed; OTS pending on any)
#   2 = FAIL (any wedge fails signature or Rekor verification)
#   3 = FAIL (missing inputs or version not found)

set -euo pipefail

VERSION="${1:-}"
WEDGE_FILTER="${2:-}"
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version> [<wedge>]   (e.g. $0 v1.0.0 phantom_precision)" >&2
  exit 3
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
V_DIR="$SCRIPT_DIR/$VERSION"

if [ ! -d "$V_DIR" ]; then
  echo "FAIL: version directory not found: $V_DIR" >&2
  exit 3
fi

# Detect layout
LAYOUT="unknown"
WEDGES=()
if [ -f "$V_DIR/manifest.yaml" ]; then
  LAYOUT="single"
  WEDGES=("__SINGLE__")
else
  # Multi-wedge: look for subdirectories containing manifest.yaml
  for d in "$V_DIR"/*/; do
    [ -d "$d" ] || continue
    wedge_name="$(basename "$d")"
    if [ -f "$d/manifest.yaml" ]; then
      WEDGES+=("$wedge_name")
    fi
  done
  if [ ${#WEDGES[@]} -gt 0 ]; then
    LAYOUT="multi"
  fi
fi

if [ "$LAYOUT" = "unknown" ]; then
  echo "FAIL: no manifest.yaml found in $V_DIR or its immediate subdirectories" >&2
  exit 3
fi

# Apply wedge filter
if [ -n "$WEDGE_FILTER" ]; then
  if [ "$LAYOUT" = "single" ]; then
    echo "FAIL: version $VERSION is single-wedge layout; ignoring wedge filter '$WEDGE_FILTER'" >&2
  else
    FILTERED=()
    for w in "${WEDGES[@]}"; do
      if [ "$w" = "$WEDGE_FILTER" ]; then
        FILTERED+=("$w")
      fi
    done
    if [ ${#FILTERED[@]} -eq 0 ]; then
      echo "FAIL: wedge '$WEDGE_FILTER' not found under $V_DIR" >&2
      exit 3
    fi
    WEDGES=("${FILTERED[@]}")
  fi
fi

IDENTITY_REGEX="^https://github\.com/DavidVALIS/valis-v3/\.github/workflows/anchor\.yml@refs/tags/benchmarks-v[0-9.]+$"
OIDC_ISSUER="https://token.actions.githubusercontent.com"

echo "==========================================================="
echo "VALIS Benchmarks Verifier"
echo "Version: $VERSION  (layout: $LAYOUT, wedges: ${#WEDGES[@]})"
echo "==========================================================="

# Per-wedge verification. Tracks the overall verdict across wedges.
OVERALL_FAIL=0
OVERALL_PENDING=0

verify_one() {
  local label="$1"
  local manifest="$2"
  local bundle="$3"
  local ots_proof="$4"

  echo
  echo "--- Verifying: $label ---"
  for f in "$manifest" "$bundle" "$ots_proof"; do
    if [ ! -f "$f" ]; then
      echo "  FAIL: missing required file: $f"
      return 3
    fi
  done

  # Cosign verify -- keyless OIDC, identity-bound to the publishing workflow
  if cosign verify-blob \
    --bundle "$bundle" \
    --certificate-identity-regexp "$IDENTITY_REGEX" \
    --certificate-oidc-issuer "$OIDC_ISSUER" \
    "$manifest" >/dev/null 2>&1; then
    echo "  cosign: OK (signature + Rekor verified)"
  else
    echo "  cosign: FAIL"
    return 2
  fi

  # Rekor metadata for the operator
  local log_index
  log_index=$(jq -r '.verificationMaterial.tlogEntries[0].logIndex' "$bundle")
  echo "  Rekor log index: $log_index  (https://search.sigstore.dev/?logIndex=$log_index)"

  # OTS verify
  local tmp_verify
  tmp_verify="$(mktemp -d)"
  trap "rm -rf '$tmp_verify'" RETURN
  cp "$manifest" "$tmp_verify/manifest.yaml"
  cp "$ots_proof" "$tmp_verify/manifest.yaml.ots"
  local ots_out ots_state
  ots_out=$(ots verify "$tmp_verify/manifest.yaml.ots" -f "$tmp_verify/manifest.yaml" 2>&1 || true)
  if echo "$ots_out" | grep -qi "success"; then
    ots_state="confirmed"
  elif echo "$ots_out" | grep -qiE "pending|not yet|complete the timestamping|calendar|not found"; then
    ots_state="pending"
  else
    ots_state="unknown"
  fi
  echo "  OTS state: $ots_state"
  if [ "$ots_state" = "confirmed" ]; then
    return 0
  else
    return 1
  fi
}

for w in "${WEDGES[@]}"; do
  if [ "$w" = "__SINGLE__" ]; then
    label="$VERSION"
    manifest="$V_DIR/manifest.yaml"
    bundle="$V_DIR/manifest.bundle.json"
    ots_proof="$V_DIR/manifest.yaml.ots"
  else
    label="$VERSION/$w"
    manifest="$V_DIR/$w/manifest.yaml"
    bundle="$V_DIR/$w/manifest.bundle.json"
    ots_proof="$V_DIR/$w/manifest.yaml.ots"
  fi
  set +e
  verify_one "$label" "$manifest" "$bundle" "$ots_proof"
  rc=$?
  set -e
  case "$rc" in
    0) ;;  # this wedge: FULL PASS
    1) OVERALL_PENDING=1 ;;  # this wedge: PARTIAL PASS
    *) OVERALL_FAIL=1; echo "  >>> Wedge $label FAILED (exit $rc)" ;;
  esac
done

echo
echo "==========================================================="
if [ $OVERALL_FAIL -ne 0 ]; then
  echo "VERDICT: FAIL ($VERSION; one or more wedges failed signature/Rekor verification)"
  echo "==========================================================="
  exit 2
fi
if [ $OVERALL_PENDING -ne 0 ]; then
  echo "VERDICT: PARTIAL PASS ($VERSION; OTS pending Bitcoin confirmation on at least one wedge)"
  echo "  - All checked wedges: cosign + Rekor verified"
  echo "  - OTS Bitcoin confirmation typically arrives 3-6h after publish; daily finalizer upgrades pending proofs."
  echo "==========================================================="
  exit 1
fi
echo "VERDICT: FULL PASS ($VERSION; every checked wedge fully verified)"
echo "==========================================================="
exit 0
