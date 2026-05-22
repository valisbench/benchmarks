# LBCI v1.0.0 -- Rev2 Build Report

Wedge: `load_bearing_claim_identification`
Version: 1.0.0
Date: 2026-05-21
Author: Claude (lead build agent)

This rev2 lands the four sponsor-adjudicated items from the cross-wedge
methodology review (`valis/benchmarks/manifest/CROSS_WEDGE_REVIEW_v1.0.0.md`).
All four decisions land in the LBCI wedge.

## Sponsor decisions and how they landed

1. **Hypothesis rewrite to precision-recall split.** H3 (single F1 < 0.6)
   replaced by H3a (tier-3 precision < 0.55) and H3b (tier-3 recall < 0.55).
   The F1 < 0.6 floor sits near a "flag everything" degenerate (precision
   ~0.40, recall = 1.0, F1 ~0.57 on a tier-3 memo with 6 LB + 9 non-LB);
   the split makes that floor visible.

2. **Seed standardization.** Generator seed changed from 19 to 42 to match
   phantom / mechgap convention. New cases.jsonl SHA committed to manifest;
   spot-check sample regenerated against the new SHA.

3. **v2 deprecation trigger pre-registered.** The rev1 "diverge meaningfully"
   hedge replaced by a numerical threshold: ">0.15 absolute F1 divergence
   on any tier between v1 synthetic and v2 expert-labeled rates on the
   same model roster." This appears verbatim in the manifest rubric, the
   scorer module docstring, and the spot-check review opener.

4. **Above-the-fold disclosure commitment.** New manifest field
   `publication_template_commitment` commits the publication template to
   lead with the methodology disclosure before any headline rate or score.
   Tolerated as an extra YAML key by the current schema; flagged as a
   follow-up for main session to model in `schema.py`.

## Files updated

Absolute paths:
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/datasets/load_bearing_claim_identification_generator.py` (unchanged; seed-independent)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/scorers/load_bearing_claim_identification_v1.py` (added tier-3 precision/recall fields; updated docstring with deprecation-trigger language)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-load_bearing_claim_identification.yaml` (new SHA, H3a+H3b hypotheses, updated rubric, new `publication_template_commitment`, updated `failure_publication_commitment`)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-load_bearing_claim_identification/cases.jsonl` (regenerated, seed=42)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-load_bearing_claim_identification/spot_check_review.md` (rewritten against new sample with updated disclosure)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-load_bearing_claim_identification/spot_check_log.json` (regenerated, SHA-bound to new cases)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/tests/test_load_bearing_claim_identification.py` (12 new tests for rev2 contract; existing 61 retained and still passing)
- `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-load_bearing_claim_identification/REV2_REPORT.md` (this file)

No shared infrastructure modified.

## Dataset (seed=42, 500 cases)

**`cases.jsonl` SHA256:** `de5784f1c9c3b3c752cd714c4b4895f3f8a869c9af3ebb33541f40422fd41e73`

| Tier | n | claims (mean) | claims range | LB (mean) | LB range | distractors (mean) | distractor range | color (mean) |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 166 | 4.39 | 3-5 | 2.51 | 2-3 | 0.54 | 0-1 | 1.35 |
| 2 | 166 | 9.29 | 8-10 | 4.48 | 4-5 | 2.51 | 2-3 | 2.30 |
| 3 | 168 | 14.03 | 12-15 | 5.92 | 5-7 | 4.49 | 4-5 | 3.61 |

Tier counts (166/166/168) sum to 500 -- identical to rev1's distribution
(tier 3 absorbs the integer-divide remainder).

Recommendation type distribution across 500 cases at seed=42:
- expand: 90, pivot_pricing: 86, acquire: 85, invest: 85, restructure: 83, deprecate: 71

Per-tier statistics reproduce within spec at the new seed; no template
re-tuning required.

## Spot-check sample (rev2)

- Sample seed: 31 (unchanged from rev1; sample seed != generator seed)
- Sample size: 50
- Stratification: by tier (17/17/16 across tiers 1/2/3)
- SHA binding: `de5784f1c9c3b3c752cd714c4b4895f3f8a869c9af3ebb33541f40422fd41e73`

The previous rev1 sample case_ids are invalidated by the new SHA (case_ids
are tied to positions in the deterministic shuffle, and the new seed
produces a different shuffle). The `spot_check_log.json` is now bound to
the rev2 cases.jsonl; the old log has been overwritten with the empty log
for the new sample.

## Scorer interface change

`RosterScore` gains two fields:
- `tier_3_macro_precision: float` -- mean per-case precision over tier-3
  non-refused cases. 0.0 on empty roster.
- `tier_3_macro_recall: float` -- mean per-case recall over tier-3
  non-refused cases. 0.0 on empty roster.

`CaseScore` is unchanged; per-case precision and recall were already
computed there. The two new RosterScore fields are aggregations of those
existing per-case numbers, restricted to tier 3.

`score_case` is unchanged.

`score_roster` adds two new aggregation calls (`_macro_precision_over`,
`_macro_recall_over` over the tier-3 slice) but does not change the
overall macro F1, per-tier macro F1, refusal handling, or any
case-disposition logic.

The signature change is additive: any caller built against the rev1
RosterScore that does not reference the new fields will continue to
work; callers that need the new fields can opt in.

## Manifest disclosure surface (rev2)

The methodology disclosure (synthetic ground truth, PRD override, v2
deprecation trigger at >0.15 absolute F1 divergence) now appears in
five places:

1. Manifest `scoring.rubric` field (verbatim from sponsor spec).
2. New manifest `publication_template_commitment` field (commits the
   publication template to lead with the disclosure above the headline).
3. Manifest `failure_publication_commitment` field (updated to reference
   the >0.15 trigger).
4. Scorer module docstring (`load_bearing_claim_identification_v1.py`).
5. Spot-check review file opener (`spot_check_review.md`).

The generator module docstring retains the rev1 disclosure language
(synthetic, PRD override, dependency graph); rev2 did not need to update
it because the generator is the same module the rev1 report described.

## Hypothesis decidability from the roster summary

A single `RosterScore` object now contains everything a reader needs to
adjudicate both rev2 hypotheses without re-aggregating per-case rows:

- H3a: `rs.tier_3_macro_precision < 0.55` -> H3a fires.
- H3b: `rs.tier_3_macro_recall < 0.55` -> H3b fires.

The publication can render the per-roster summary as a table and apply
the hypothesis thresholds in a one-line conditional. No per-case
re-scoring required.

## Tests

- 73 LBCI tests pass.
- New tests added in rev2 (12):
  - `test_roster_score_dataclass_fields_present` updated to require
    `tier_3_macro_precision`, `tier_3_macro_recall`.
  - `test_tier_3_precision_and_recall_reported_separately` (empty-roster
    default behavior of the two new fields).
  - `test_tier_3_precision_tanks_when_flag_all_classifier` (the
    degenerate-floor surfacing test: flag-all hits precision <0.55).
  - `test_tier_3_recall_tanks_when_silent_classifier` (silent classifier
    hits recall = 0.0).
  - `test_tier_3_precision_and_recall_are_one_when_oracle` (top-out).
  - `test_tier_3_precision_aggregates_only_tier_3_cases` (mixed-tier
    cases do not contaminate the tier-3 aggregate).
  - `test_scorer_docstring_includes_pre_registered_deprecation_trigger`
    (locks the 0.15 number into the scorer docstring; locks out the rev1
    "meaningfully" hedge).
  - `test_manifest_hypotheses_are_h3a_and_h3b_precision_recall_split`
    (locks H3a + H3b structure into the manifest).
  - `test_manifest_rubric_includes_pre_registered_deprecation_trigger`
    (locks the 0.15 number into the manifest rubric).
  - `test_manifest_rubric_documents_precision_recall_split_rationale`
    (rubric explains the floor).
  - `test_manifest_has_publication_template_commitment` (locks the new
    YAML field).
  - `test_manifest_validates_through_load_manifest` (the rev2 manifest
    still validates through `load_manifest()`; extra
    `publication_template_commitment` field is tolerated).
  - `test_seed_42_reproduces_committed_sha` (locks the SHA-vs-seed
    relationship so any future contributor changing the seed without
    regenerating breaks the build loudly).
- 61 rev1 tests retained, still passing.
- Full benchmark suite excluding `test_citation_faithfulness.py`:
  532 passed. (citation_faithfulness has 21 unrelated failures from
  its own in-flight rev2 work -- the wedge's `_format_excerpt()`
  signature changed without callers being updated. LBCI does not
  touch that module.)

## Schema-tolerance follow-up for main session

The new manifest field `publication_template_commitment` is currently
tolerated by Pydantic V2's default `extra="ignore"` behavior. The schema
does not formally model the field. Two options for main session's harness
pass:

1. **Add an optional field to `ManifestSchema`:**
   ```python
   publication_template_commitment: Optional[str] = Field(
       default=None,
       min_length=20,
       description="..."
   )
   ```
   Pro: schema documents the field; tests can assert presence via
   Pydantic. Con: only LBCI uses it today; the other 5 wedges would
   have the field as `None`, which a hostile reviewer could read as
   "the other wedges aren't committed to disclosure placement."

2. **Promote it to a wedge-specific commitment block.** Add a
   `wedge_specific_commitments: dict[str, str]` field to ManifestSchema
   that LBCI populates with the publication template commitment and
   other wedges can populate with their own commitments as they emerge
   in v2+.

The wedge-specific approach is more extensible but more change. v1.0.0
publication can ship with option 1 if the main session prefers the
simpler path.

## Cross-wedge coordination notes

- The `model_id_provenance` block is verbatim from rev1, which itself
  copied phantom_precision's block. All six wedges share this block,
  consistent with the cross-wedge review's recommendation.
- The seven-category outcome taxonomy and refusal-handling contract are
  unchanged from rev1; both match phantom / mechgap / falsifier /
  citation / boundary.
- LBCI is now the only wedge in the v1.0.0 batch with a precision-recall
  split hypothesis. The cross-wedge review explicitly named this as the
  right call for LBCI specifically (the F1 floor problem is structural
  to the wedge's claim-set scoring; the other wedges score on binary
  classification or span overlap where the floor doesn't arise the same
  way).
- LBCI is now the only wedge in the v1.0.0 batch with a
  `publication_template_commitment` field. If main session prefers
  uniformity, the field can be added to the other five manifests as
  shorter or empty strings; if main session prefers wedge-specific
  commitments, LBCI's commitment stays unique. Recommendation: leave
  the field LBCI-specific in v1.0.0; the methodology override is what
  makes the commitment necessary, and the other wedges do not have an
  override of equivalent scrutiny.

## Spot-check next

The rev2 cases.jsonl is now ready for the 50-case stratified spot-check
per the standard protocol (`valis/benchmarks/manifest/SPOT_CHECK_AGENT_INSTRUCTIONS.md`).
The review file's opener documents the LBCI-specific framing
(reviewer is auditing the generator's construction, not labelers'
calls against a rubric). 48/50 pass threshold applies as for the other
wedges.

If spot-check passes at 48/50 or above, the wedge is locked for v1.0.0
publication and proceeds to the harness layer (prompt + response parser
+ scoring_pass dispatch -- the three shared-infrastructure items the
cross-wedge review flagged as main-session work).
