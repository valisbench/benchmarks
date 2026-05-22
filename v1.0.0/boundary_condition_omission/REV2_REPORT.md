# REV2 Report: boundary_condition_omission v1.0.0

## Rev2 changes (this revision)

Cross-wedge methodology review (`valis/benchmarks/manifest/CROSS_WEDGE_REVIEW_v1.0.0.md`)
flagged two manifest-rubric documentation gaps for this wedge:

1. **Cross-BC overlap rationale.** The keyword-group matcher admits cases
   where one candidate covers multiple BCs because BC concept terms overlap
   (e.g., "baseline" and "segment" both appear in several BCs' keyword
   groups). Rev1 acknowledged this in REV1_REPORT.md but did not name the
   trade-off in the manifest itself. A reader of the manifest could not
   know whether the recall-inflation is by-design or a bug. Rev2 adds a
   verbatim paragraph to `scoring.rubric` explaining the choice: accept
   the recall-inflation because H1 keys on recall falling below 0.4 in
   tier 3, and inflating recall raises the falsifiability bar in the
   doctrine-aligned direction.

2. **Upstream parsing assumption.** The scorer's contract begins with
   `Sequence[str]` candidates. Rev1 documented the parsing protocol only
   in REV1_REPORT.md's "Methodology questions for cross-wedge review"
   section. A third party verifying the score without VALIS context would
   not see it. Rev2 adds a verbatim paragraph to `scoring.rubric` naming
   the harness contract: numbered/bulleted-list prompts parsed line-by-line,
   leading bullets/numbers/punctuation stripped, long prose split on sentence
   boundaries, empty list treated as zero TPs (not as refusal).

No cases regeneration, no SHA change, no scorer/generator code change.
Only the YAML `scoring.rubric` string was edited. The manifest now
validates through `load_manifest()` cleanly because the main session
widened the schema's wedge Literal and replaced the alias validator
before rev2 launched.

Tests: 62/62 pass on this wedge (unchanged). Full benchmark suite: 584/584
pass. SHA256 of cases.jsonl unchanged
(`e34d8f7d82e60cc183006e947682503ad19a2ab0ec726fa37358860c0b7b24b7`); the
spot-check log binding therefore remains valid.

The rev1 baseline below is preserved verbatim for traceability.

---

# REV1 Baseline (carried forward, unchanged)

## Files Created

- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/datasets/boundary_condition_omission_generator.py` -- generator
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/scorers/boundary_condition_omission_v1.py` -- scorer
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-boundary_condition_omission.yaml` -- manifest
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-boundary_condition_omission/cases.jsonl`
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-boundary_condition_omission/spot_check_review.md` -- 50 cases stratified by tier
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-boundary_condition_omission/spot_check_log.json` -- empty log bound to cases SHA256
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/tests/test_boundary_condition_omission.py` -- 62 unit tests

## Generator parameters

- Seed: `42`
- Count: `500`
- Tier distribution: uniform `(1/3, 1/3, 1/3)`, with remainder absorbed into tier 3 by construction
- Case-ID prefix: `bco` -> pattern `bco-tN-NNNN`
- Determinism: seeded `random.Random` only; no global RNG, no clock, no `os.urandom`

### Claim families (12)

`retention, ab_test, revenue, nps, cost, marketing, feature_adoption, hiring, latency, support_tickets, pipeline, model_accuracy`

Each family carries:
- 10 boundary conditions (BCs) with `keyword_groups` encoding the paraphrase scope for matching
- 8 topical distractors (claim-adjacent items that are not real BCs)
- Tier-graded claim templates: T1 includes explicit "assuming X" hedges; T2 and T3 use confident phrasing

### BC vocabulary

Shared keyword-group constants across families: `_KW_BASELINE, _KW_SEGMENT, _KW_DEFINITION, _KW_SEASONALITY, _KW_SAMPLE_SIZE, _KW_OUTLIERS, _KW_CONFIDENCE, _KW_TIME_WINDOW, _KW_AGGREGATION, _KW_COHORT_AGG, _KW_SELECTION, _KW_CONFOUNDER, _KW_CAUSAL, _KW_DATA_SOURCE, _KW_DEFINITIONAL_CHANGE, _KW_CHURN_DEF, _KW_RETENTION_DEF, _KW_REVENUE_DEF, _KW_CONVERSION_DEF, _KW_CONTROL_GROUP, _KW_CURRENCY, _KW_TENURE, _KW_GEOGRAPHY, _KW_PRICING, _KW_PRODUCT_CHANGE, _KW_NEW_VS_REPEAT, _KW_ACQUISITION_CHANNEL`.

Each group includes 4-16 phrasing alternatives. A candidate matches a BC iff for every keyword group, the candidate contains at least one alternative.

### Distractor patterns

- **Irrelevant context**: "Whether the engineering team celebrated" / "Whether marketing spend changed"
- **Process/sign-off noise**: "Whether the CFO has signed off" / "Whether finance approved the categorization"
- **Communication artifacts**: "Whether the result was tweeted" / "Whether it appears in the board pack"
- **Visual/UI red herrings**: "Whether the dashboard renders a green badge" / "Whether the page has a custom favicon"
- **Adjacent metrics**: "Whether NPS scores improved" (when claim is about retention)

These are claim-adjacent (share vocabulary) but their falsification would not cast doubt on the claim itself, so a thoughtful reviewer would not flag them.

## Cases SHA256 and tier counts

- **SHA256**: `e34d8f7d82e60cc183006e947682503ad19a2ab0ec726fa37358860c0b7b24b7`
- **Total**: 500 cases (884,175 bytes)
- **Tier 1**: 166 cases, avg BCs = 3.00, avg distractors = 0.00
- **Tier 2**: 166 cases, avg BCs = 5.00, avg distractors = 3.00
- **Tier 3**: 168 cases, avg BCs = 7.57, avg distractors = 5.00
- **Spot-check sample stratification (50 cases, seed=19)**: tier-1: 17, tier-2: 17, tier-3: 16

## Matching method: chosen and rationale

**Chosen**: deterministic keyword-group matching.

For each BC, the ground truth encodes a list of `keyword_groups`. Each group represents one BC aspect (a concept the BC turns on). A candidate item matches the BC iff for every group, the candidate (normalized: lowercase, punctuation collapsed, whitespace collapsed) contains at least one alternative from that group. Substring match; no stemming; no lemmatization; no LLM.

### Why not embedding cosine

- A pinned embedding model means pinning a huggingface revision + tokenizer + cosine library version. Third parties verifying from a clean machine without VALIS infrastructure would need to install all of that and reproduce the exact tokenization. Brittle in 6 months, broken in 2 years.
- Different embedding models produce different distance distributions, so the 0.75-0.85 threshold has no canonical meaning.
- Adds an additional source of non-reproducibility that violates the platform's core anchoring posture.

### Why not LLM-judge

- LLM-judge is non-deterministic across runs (even at `temperature=0` for many providers).
- Requires API access at verification time. A third party needs an API key and a budget to reproduce the score. The benchmark's reproducibility commitment is "no VALIS infrastructure required" -- requiring an OpenAI key to verify VALIS results is structurally adjacent to the same problem the doctrine names.
- LLM-judge ruling can drift when the judge model is deprecated and replaced. The benchmark would then need to re-anchor with a new judge model; in the meantime, all anchored manifests become unverifiable.
- The PRD does permit "LLM-applied rubrics" in the scoring step, but the spirit of the platform pushes toward maximum reproducibility.

### Trade-off acknowledged

Keyword-group matching is stricter than a perfectly tuned semantic matcher. A model output that paraphrases a BC using novel synonyms not represented in the keyword group will miss. The keyword groups must be maintained as paraphrase surfaces evolve. This is documented in the scorer module-doc and in the manifest rubric as a v1 methodological tradeoff. v2 may layer in a secondary embedding-based pass and report both metrics in parallel; the keyword-group score remains canonical for v1.

### Co-pre-registration

The keyword groups are part of the dataset, under the same SHA256 the manifest commits to. Auditors inspect the ground truth and the matching rule together. There is no separate prompt-hash or model-snapshot to anchor.

## Test results

`pytest valis/benchmarks/tests/test_boundary_condition_omission.py -v`

```
62 passed in 0.19s
```

Full benchmark suite (including all parallel wedges and existing wedges):

```
517 passed in 0.80s
```

Test coverage:
- Determinism (3 tests): same seed -> byte-identical output; different seed -> different output; JSONL serialization is byte-stable
- Schema (7): case fields, BC fields, distractor fields, IDs unique within case, case_id prefix override
- Tier constraints (8): per-tier BC counts, per-tier distractor counts, tier distribution (uniform default and 500-case target), custom tier distributions, error handling
- Tier hedge style (2): T1 claims contain "assuming"; T3 claims do not
- Generator self-consistency (4): every family has >= 8 BCs and >= 5 distractors; every BC text contains a keyword from each of its groups; same for distractors
- Scorer normalization (3): lowercases, strips punctuation, collapses whitespace
- Scorer matching (5): single-group, multi-keyword OR, multi-group AND, case-insensitive after normalize, empty-groups edge case
- Scorer per-case math (10): TP/FP/FN counting, refusal handling, edge cases
- Scorer roster math (5): aggregation, refusal counting, empty roster, distractor-match-rate diagnostic
- Generator + scorer integration (4): oracle hits recall=1.0 on all 120 generated cases; silent model -> F1=0; distractor-only model -> low recall; half-correct model -> recall ~0.4
- Dataclass invariants (3): frozen, tuples, fields present
- Manifest binding (4): cases.jsonl exists with 500 cases; cases.jsonl SHA256 matches manifest; manifest YAML parses with all required fields; pre-registered cases match `generate(seed=42, count=500)` byte-for-byte
- Spot-check binding (2): log exists and binds to cases SHA; sample is stratified by tier

## Methodology questions for cross-wedge review

### 1. Free-text response parsing is upstream

The scorer assumes the harness has already parsed the model's free-text response into a list of candidate items (`Sequence[str]`). The parser is not part of this scorer. This is consistent with phantom_precision (which assumes the harness has produced `flagged_spans`) and mechanism_gap (which assumes the harness has produced a single `predicted_label`). But for free-text BC lists, parsing is harder than for spans or single labels.

**Recommended harness behavior** (to document in the run-script PRD, not in this scorer):
- Prompt the model to produce a numbered or bulleted list.
- Parse line-by-line; strip leading bullets/numbers/punctuation.
- One line = one candidate item.
- If the response is a long prose paragraph instead of a list, the harness should split on sentence boundaries and treat each sentence as a candidate.
- An empty list (no items produced) is treated as scoring zero TPs (not as a refusal).

This is the wedge that is most sensitive to harness-side parsing. The scorer itself is parser-agnostic, which keeps the scorer's contract simple and pre-registerable.

### 2. Should BC-BC overlap be tightened?

The current keyword groups admit some legitimate cross-BC matching: a candidate saying "across which baseline segment" can satisfy both the "Compared to which baseline period" BC and the "Across which customer segment" BC, because both BCs include those terms in their groups. This is mostly correct (a multi-aspect candidate covers multiple BCs) but can inflate recall when a model's coverage is concentrated in shared concept clusters.

Three options for cross-wedge review:
- **(a) Accept**: recall-inflating bias makes the H1 prediction harder to confirm, which raises the falsifiability bar -- aligning with the doctrine. Current choice.
- **(b) Tighten**: make each BC's keyword groups disjoint with all other BCs in the family. Adds maintenance burden and risks under-covering legitimate paraphrases.
- **(c) Set-membership scoring**: enforce that each candidate matches at most one BC (e.g., assign to the BC with the most groups satisfied; ties broken by id). Cleaner but adds matcher complexity.

### 3. Distractor over-flag signal

Distractor matches are folded into `fp`, so they hurt precision -- this is the only signal in the scorer's headline F1 that distractors exist. The `distractor_match_rate` is reported separately for diagnostics. The pre-registered hypothesis (H1) is keyed to recall, not precision. If we want to also measure "models over-flag at tier 3," we would need a secondary pre-registered hypothesis (H2-style) targeting precision or distractor_match_rate. For rev1 I left this as a single H1; revisiting is a sponsor call.

### 4. Should the BC list be "complete"?

A BC list is never complete in principle -- a determined reviewer can always think of one more thing to check. The dataset captures 3-8 BCs per case, which is in the spec range, but these are not exhaustive enumerations of every conceivable boundary. Models that surface additional, legitimate BCs not in the ground truth will be counted as `fp` (unmatched candidates).

This is the same trade-off phantom_precision has (a model that flags a real-but-not-fabricated number gets penalized). The pre-registration commits to the ground truth as authoritative even though it is partial. The spot-check pass criterion is that listed BCs are real and listed distractors are real distractors -- not that the BC list is exhaustive.

### 5. Concepts in keyword groups overlap with BC text -- self-coverage

To preserve oracle-recall=1.0, every BC text must contain at least one keyword from each of its keyword groups. This is verified by `test_every_bc_text_contains_keyword_from_each_group`. It means each BC text is "anchored" in the keyword groups by construction. The shape of paraphrase coverage is therefore deterministic and inspectable.

A side effect: changing a BC's text in cases.jsonl without also updating its keyword groups would break the oracle invariant. This is intentional -- the dataset is frozen at the SHA256, so post-pre-registration edits to BC text aren't possible without re-anchoring anyway.

## Spec ambiguities and how they were resolved

### A1. "Set recall" definition for free-text matching

The spec named "set recall" and "set precision" for the scorer. With free-text outputs, "set recall" is well-defined (fraction of ground-truth BCs covered by at least one candidate). "Set precision" required a choice: are unmatched candidates false positives or do they not count? I chose **unmatched candidates count as FPs** -- the model is penalized for emitting items that turn out to be neither BCs nor distractors. This makes precision the conjunction of "didn't fabricate" and "didn't over-flag." Documented in the scorer rubric.

### A2. Distractor handling

The spec said models output a free-text list given the claim alone (not given the distractors). Distractors exist as ground-truth metadata to detect over-flag patterns. I made distractor matches count as `fp` (hurts precision) and report a separate `distractor_match_rate`. This treats distractors as "trap items the model could be tempted by," which is the role they play in spec.

### A3. T3 "topical overlap" in distractors

The spec said tier 3 distractors should have "topical overlap" with the claim. I implemented this by drawing tier-3 distractors from the same family's `distractor_pool` (which is per-family curated to share vocabulary). No mixing of families' distractors across cases. This is the cleanest realization; spec was ambiguous on whether overlap meant "same domain" or "share specific words." I went with the former.

### A4. "Plausible-sounding" claims

Spec said claims should be "plausible" strategy-memo prose. I implemented templated claims with tier-graded phrasing: T1 includes explicit "assuming" hedges; T2 confident with some softening; T3 confident with no explicit hedges. All claims read as the kind of one-liner an exec would say in a meeting -- the kind a careful reviewer would push back on.

### A5. SHA256 + manifest mismatch with existing v1.0.0 manifests (documented gap)

The schema in `valis/benchmarks/manifest/schema.py` only permits `wedge: Literal["phantom_precision", "mechanism_gap"]` and `metric: Literal["f1", "binary_f1", "recall", "precision"]`. The existing v1.0.0 manifests for phantom_precision and mechanism_gap both include a `model_id_provenance` field that the schema does not declare, and they pin model_ids (`claude-opus-4-7`, `gemini-3.1-pro-preview`) that the schema's validator rejects as "alias-like." The existing v1.0.0 manifests are therefore not strictly validatable against the current schema.

Per the hard constraint ("DO NOT modify shared infrastructure ... If your wedge needs a missing feature, document the gap and stop"), I did not modify `schema.py`. My manifest follows the same pattern (extra `model_id_provenance` field; same model_ids verbatim per spec). This is a **documented infrastructure gap**: the schema and the published v1.0.0 manifests are out of sync, and adding `boundary_condition_omission` (plus the 3 parallel wedges) to the schema's `wedge` Literal is a single one-line change that should be batched at cross-wedge integration time, not done by each wedge agent.

### A6. Model-roster verbatim

Per spec, I copied the roster (3 models with sampling params) and `model_id_provenance` block verbatim from `v1.0.0-phantom_precision.yaml`. spike_run: false. case_count: 500. All matches the spec instruction.
