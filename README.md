# VALIS Benchmarks

Pre-registered, transparency-log-anchored evaluations of frontier model epistemic-failure modes.

This repository is the public publication surface for the VALIS Benchmarks Platform. Every published manifest, dataset (public split), and result is committed here, signed with Sigstore cosign (keyless OIDC), and dual-anchored to **Sigstore Rekor** (synchronous) and **OpenTimestamps** (Bitcoin-confirmed via a daily finalizer).

The rig that runs the benchmarks lives in the VALIS monorepo. This repo is the publishing surface and the verifier. The split is intentional: a third party can verify every published result without seeing or trusting any VALIS internal code.

## What gets published here

Each published benchmark lands as a versioned directory:

```
v<semver>/
  manifest.yaml             # pre-registered methodology, hashed and signed
  manifest.bundle.json      # cosign Sigstore bundle (keyless OIDC + Rekor proof)
  manifest.yaml.ots         # OpenTimestamps proof (pending or Bitcoin-confirmed)
  datasets/<wedge>/cases.jsonl    # public-split dataset (private partition stays in the monorepo)
  results/<wedge>/runs.jsonl      # per-case outcomes per model
  results/<wedge>/scores.json     # aggregate F1, refusal rates, hypothesis test results
  reviewer/                  # external methodology reviewer's verbatim critique
  README.md                  # short methodology summary; full version in manifest
```

## Verifying a publication

You don't have to trust us. You have to trust:
1. Sigstore (Linux Foundation)
2. The OpenTimestamps Bitcoin block proof
3. Your own computer

Anyone can verify a published result with no VALIS access:

```bash
# Clone this repo
git clone https://github.com/valisbench/benchmarks.git
cd benchmarks

# Run the verifier against a published version
./verify.sh v1.0.0

# Or from a clean Docker container (cleanest -- no host toolchain assumed):
docker build -t valisbench-verify .
docker run --rm -v "$(pwd)":/spike:ro valisbench-verify v1.0.0
```

The verifier:
1. Recomputes the manifest SHA256 from the published file.
2. Verifies the cosign signature against the recorded OIDC identity (the GitHub Actions workflow that signed it).
3. Confirms the Rekor entry exists at the recorded log index.
4. Verifies the OpenTimestamps proof. Returns FULL PASS if Bitcoin-confirmed, PARTIAL PASS if still pending (typical for the first 3-6 hours after publication; the daily finalizer upgrades it).

## Governance

- **Pre-registration is non-negotiable.** Methodology, datasets, scoring rubric, and pre-declared hypotheses are committed and anchored BEFORE any model is called. After-the-fact rationalization is structurally prevented.
- **Unfavorable results publish.** Including null results. Including results where VALIS-recommended architecture does not outperform baselines.
- **External methodology reviewer.** Every publication includes one publicly-named external reviewer's verbatim critique. Their sign-off (or refusal to sign with documented reasons) is the publication gate.
- **Refusal is data.** When a model declines to evaluate a prompt, the refusal is logged automatically with the prompt category and the timestamp. Refusals are published, not hidden.

See `https://decision-grade.ai/the-doctrine/` for the doctrinal foundation.

## License

This repository is licensed under Apache 2.0. Methodology documents (`manifest.yaml`, reviewer critiques, README files within `v<semver>/`) are additionally available under CC-BY-4.0 for academic re-use and citation.
