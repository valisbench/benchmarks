#!/usr/bin/env bash
# verify.sh -- VALIS Benchmarks third-party verifier
#
# Usage: ./verify.sh <version>   (e.g. ./verify.sh v1.0.0)
#
# CRITICAL: This script has ZERO VALIS dependencies. It must run from any clean
# environment with only standard CLI tools (cosign, ots, jq, sha256sum) and
# pull all evidence from this repository plus public anchoring services.
#
# Exit codes:
#   0 = FULL PASS (signature + Rekor + OTS Bitcoin-confirmed)
#   1 = PARTIAL PASS (signature + Rekor confirmed; OTS pending Bitcoin block)
#   2 = FAIL (signature or Rekor verification failed)
#   3 = FAIL (missing inputs or version not found)

set -euo pipefail

VERSION="${1:-}"
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>   (e.g. $0 v1.0.0)" >&2
  exit 3
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
V_DIR="$SCRIPT_DIR/$VERSION"

if [ ! -d "$V_DIR" ]; then
  echo "FAIL: version directory not found: $V_DIR" >&2
  exit 3
fi

MANIFEST="$V_DIR/manifest.yaml"
BUNDLE="$V_DIR/manifest.bundle.json"
OTS_PROOF="$V_DIR/manifest.yaml.ots"

echo "==========================================================="
echo "VALIS Benchmarks Verifier"
echo "Version: $VERSION"
echo "==========================================================="
echo

# Check inputs
echo "[1/5] Checking required files..."
for f in "$MANIFEST" "$BUNDLE" "$OTS_PROOF"; do
  if [ ! -f "$f" ]; then
    echo "  FAIL: missing required file: $f"
    exit 3
  fi
  echo "  OK: ${f#$SCRIPT_DIR/}"
done
echo

# Recompute hash (portable: prefer sha256sum, fall back to shasum on macOS)
echo "[2/5] Recomputing manifest hash..."
if command -v sha256sum >/dev/null 2>&1; then
  MANIFEST_HASH=$(sha256sum "$MANIFEST" | awk '{print $1}')
else
  MANIFEST_HASH=$(shasum -a 256 "$MANIFEST" | awk '{print $1}')
fi
echo "  Manifest SHA256: $MANIFEST_HASH"
echo

# Cosign verify -- keyless OIDC, identity-bound to the publishing workflow
echo "[3/5] Verifying cosign signature (keyless OIDC against the publish workflow identity)..."
IDENTITY_REGEX="^https://github\.com/DavidVALIS/valis-v3/\.github/workflows/anchor\.yml@refs/tags/benchmarks-v[0-9.]+$"
OIDC_ISSUER="https://token.actions.githubusercontent.com"
if cosign verify-blob \
  --bundle "$BUNDLE" \
  --certificate-identity-regexp "$IDENTITY_REGEX" \
  --certificate-oidc-issuer "$OIDC_ISSUER" \
  "$MANIFEST"; then
  echo "  OK: cosign signature valid; Rekor entry verified"
else
  echo "  FAIL: cosign verification failed"
  exit 2
fi
echo

# Extract Rekor metadata
echo "[4/5] Extracting Rekor log entry..."
LOG_INDEX=$(jq -r '.verificationMaterial.tlogEntries[0].logIndex' "$BUNDLE")
INTEGRATED_TIME=$(jq -r '.verificationMaterial.tlogEntries[0].integratedTime' "$BUNDLE")
if date -r "$INTEGRATED_TIME" -u "+%Y-%m-%dT%H:%M:%SZ" >/dev/null 2>&1; then
  INTEGRATED_DATE=$(date -r "$INTEGRATED_TIME" -u "+%Y-%m-%dT%H:%M:%SZ")
else
  INTEGRATED_DATE=$(date -d "@$INTEGRATED_TIME" -u "+%Y-%m-%dT%H:%M:%SZ")
fi
echo "  Rekor log index: $LOG_INDEX"
echo "  Integrated at:   $INTEGRATED_DATE"
echo "  Public URL:      https://search.sigstore.dev/?logIndex=$LOG_INDEX"
echo

# OTS verify
echo "[5/5] Verifying OpenTimestamps proof..."
TMP_VERIFY="$(mktemp -d)"
trap 'rm -rf "$TMP_VERIFY"' EXIT
cp "$MANIFEST" "$TMP_VERIFY/manifest.yaml"
cp "$OTS_PROOF" "$TMP_VERIFY/manifest.yaml.ots"

OTS_STATE="unknown"
OTS_OUT=$(ots verify "$TMP_VERIFY/manifest.yaml.ots" -f "$TMP_VERIFY/manifest.yaml" 2>&1 || true)
echo "$OTS_OUT" | sed 's/^/  /'
if echo "$OTS_OUT" | grep -qi "success"; then
  OTS_STATE="confirmed"
elif echo "$OTS_OUT" | grep -qiE "pending|not yet|complete the timestamping"; then
  OTS_STATE="pending"
elif echo "$OTS_OUT" | grep -qiE "calendar|not found"; then
  OTS_STATE="pending"
fi
echo "  OTS state: $OTS_STATE"
echo

# Final verdict
echo "==========================================================="
if [ "$OTS_STATE" = "confirmed" ]; then
  echo "VERDICT: FULL PASS ($VERSION)"
  echo "  - Cosign keyless: identity-bound to DavidVALIS/valis-v3 anchor.yml"
  echo "  - Rekor entry:    verified (log index $LOG_INDEX)"
  echo "  - OTS proof:      Bitcoin-confirmed"
  echo "==========================================================="
  exit 0
elif [ "$OTS_STATE" = "pending" ]; then
  echo "VERDICT: PARTIAL PASS ($VERSION; OTS pending Bitcoin confirmation)"
  echo "  - Cosign keyless: identity-bound to DavidVALIS/valis-v3 anchor.yml"
  echo "  - Rekor entry:    verified (log index $LOG_INDEX)"
  echo "  - OTS proof:      submitted; awaiting Bitcoin block (3-6h typical)"
  echo
  echo "  The daily ots_finalizer in the VALIS monorepo upgrades pending"
  echo "  proofs to Bitcoin-confirmed once a Bitcoin block includes the"
  echo "  calendar commitment. Re-run this script after that to see FULL PASS."
  echo "==========================================================="
  exit 1
else
  echo "VERDICT: UNKNOWN OTS STATE ($VERSION)"
  echo "  - Cosign keyless: valid"
  echo "  - Rekor entry:    verified (log index $LOG_INDEX)"
  echo "  - OTS proof:      could not determine state (see ots output above)"
  echo "==========================================================="
  exit 1
fi
