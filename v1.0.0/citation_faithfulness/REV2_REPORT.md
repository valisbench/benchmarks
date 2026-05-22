# REV2 Report: citation_faithfulness Wedge

**Wedge:** `citation_faithfulness`
**Manifest version:** 1.0.0
**Status:** rev2 complete; halted per spec
**Reviewer:** Awaiting spot-check pass

This report supersedes REV1_REPORT.md. The rev1 file is preserved at
`REV1_REPORT.md` for the historical record.

---

## What rev2 changed

1. **Subcategory-denominator clarification added to manifest rubric** (per
   cross-wedge review Inconsistency #3). The `scoring.rubric` field in
   `v1.0.0-citation_faithfulness.yaml` now carries the verbatim paragraph
   the cross-wedge review requested: "Subcategory F1 (contradictory,
   tangential) is computed against the subcategory's positives plus the
   full faithful negative set. Without including the faithful negatives,
   subcategory precision would be artificially 1.0 because the
   subcategory subset would contain no negatives to mistake for
   positives. This denominator choice is pre-registered; it matches the
   scorer's SubcategoryScore docstring."

2. **Meta-phrase variety pass.** Rev1 used fixed prose in templates, so
   phrases like "the methodology room" or "the standard caveats around
   revisions" recurred in 40-70+ cases across the 500-case set. Rev2
   refactors the generator to draw analyst-voice phrases from 38 named
   slot libraries (695 total variants) and switches the sampler to a
   deck-style picker (`_DeckSampler`) that reshuffles when exhausted,
   so no variant exceeds the fair-share recurrence ceiling.

3. **Cases regenerated, new SHA256, all artefacts re-bound.** Seed 42
   unchanged; the new SHA is committed in the manifest, log, and review.

4. **Four new tests** lock the rev2 invariants:
   - `test_meta_phrase_pools_exist` -- at least 18 meta-phrase pools defined
   - `test_meta_phrase_pools_minimum_variant_count` -- each pool >= 12 variants
   - `test_no_meta_phrase_variant_exceeds_recurrence_ceiling` -- the
     headline rev2 invariant: max per-variant recurrence <= 5
   - `test_rev1_heavy_offenders_are_thinned` -- regression test against
     reintroducing rev1's fixed-prose phrases

---

## Files Touched in Rev2

| File | Change |
|---|---|
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/datasets/citation_faithfulness_generator.py` | Added 38 slot libraries, `_DeckSampler`, `_MetaPhraseSamplers`, refactored every excerpt template to use slots. Extended `_normalize_articles` to catch "the full the X" patterns. |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness.yaml` | Added subcategory-denominator paragraph to `scoring.rubric`. Updated `cases_sha256`. |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/cases.jsonl` | Regenerated from rev2 generator (seed=42). |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/spot_check_log.json` | Reissued; empty, bound to the new SHA. |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/spot_check_review.md` | Regenerated; 50-case stratified sample over the rev2 cases. |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/tests/test_citation_faithfulness.py` | Added 4 rev2 recurrence-ceiling tests. |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/REV2_REPORT.md` | This report. |

REV1_REPORT.md left in place for historical record per convention.

---

## Rev2 Cases SHA256

- **Previous (rev1):** `aa32292dfac0c450cfe231dbe7d14bc75c199ae71e224ce1c8dfb53605b59010`
- **Current (rev2):** `9982d7e97ed4535695cf4e0517bb9c64bffce6f30fe09a461867ac796c8d6584`

The cases distribution is unchanged: 500 cases, ~167 per tier, 50% faithful
/ 25% contradictory / 25% tangential.

---

## Recurrence Ceiling -- Before vs. After

The headline measurement for rev2 is the per-variant recurrence ceiling.
"Recurrence" = how many of the 500 source_excerpts contain a given fixed
analyst-voice phrase as a substring. Rev1's heavy offenders sat at 40-70+
cases each. Rev2 target: no variant exceeds ~5.

| Phrase | Rev1 count | Rev2 count |
|---|---:|---:|
| "the methodology room" | 71 | 3 |
| "high-frequency proxies" | 57 | 4 |
| "the standard caveats around revisions" | 56 | 2 |
| "robust to the standard exclusions" | 48 | 2 |
| "the picture is more mixed" | 48 | 3 |
| "after a methodological review covering" | 48 | 4 |
| "broadly consistent with the trajectory" | 43 | 3 |
| "in line with the headline narrative" | 43 | 2 |
| "the working group" (substring) | 41 | 9 |
| "the most recent vintage" | 41 | 3 |
| "the assessments circulated in the working group" | 41 | 3 |
| "contributing roughly the share one would expect" | 48 | 3 |
| "The headline finding is unchanged from our preliminary release" | 45 | 3 |
| "The release continues the broader pattern visible" | 35 | 3 |
| "after weighing the working-group concerns" | 24 | 1 |

"the working group" at 9 is the worst remaining substring metric. That
count aggregates across multiple distinct slot variants (each firing at
1-3 cases on its own), so no single variant exceeds the ceiling -- the
substring just appears in several legitimate methodology-attribution
variants. The four rev2 tests check the per-variant ceiling, not the
overlapping-substring count, because the per-variant view is what
actually flags fixed-prose regressions.

**Max per-variant recurrence after rev2:** **5** (variant:
`"lining up with the aggregate inside the typical band"`, from
`_AGGREGATE_ALIGNMENT`). The rev2 spec asked for "no meta-phrase appears
in more than ~5 cases"; that ceiling is met exactly.

---

## Slot Library Inventory

38 meta-phrase pools, 695 total variants:

| Pool | Variants | Where it fires |
|---|---:|---|
| `_FAITHFUL_OPENING` | 25 | T3 faithful + T3 period-tangential |
| `_TEAM_ATTRIBUTION` | 25 | T3 faithful + T3 period-tangential |
| `_METHODOLOGY_ATTESTATION` | 25 | T3 faithful + T3 period-tangential |
| `_FAITHFUL_OBSERVATION` | 20 | T2 faithful |
| `_CONSISTENCY_AFFIRMATION` | 20 | T1 faithful |
| `_T1_FAITHFUL_STABILIZER` | 20 | T1 faithful (template 1) |
| `_T1_FAITHFUL_PEER_CHECK` | 20 | T1 faithful (template 2) |
| `_T2_FAITHFUL_OPENER_REVIEW` | 15 | T2 faithful (template 1) |
| `_T2_FAITHFUL_RESIDUAL_NOTE` | 15 | T2 faithful (template 1) |
| `_T2_FAITHFUL_SUBGROUP_CONTRIBUTION` | 15 | T2 faithful (template 1) |
| `_T2_FAITHFUL_TEMPLATE2_CLOSER` | 15 | T2 faithful (template 2) |
| `_T3_FAITHFUL_OPENER_PUBLISH` | 15 | T3 faithful (template 2) |
| `_T3_FAITHFUL_DIRECTIONAL_CHECK` | 15 | T3 faithful (template 2) |
| `_T1_FAITHFUL_HEADLINE_OPENER` | 15 | T1 faithful (template 2) |
| `_METHODOLOGY_CAVEAT` | 25 | T3 faithful, T3 region-tangential |
| `_ROBUSTNESS_CLAIM` | 20 | T2 faithful (template 1) |
| `_AGGREGATE_ALIGNMENT` | 30 | T2 faithful, T2 contradictory, T3 tangential variants |
| `_TRAJECTORY_CONFIRMATION` | 20 | T3 faithful (template 1) |
| `_HEADLINE_AGREEMENT` | 20 | T3 faithful (template 1) |
| `_T1_CONTRADICTORY_OPENING` | 20 | T1 contradictory |
| `_T1_CONTRADICTORY_MAGNITUDE_NOTE` | 15 | T1 contradictory (template 1) |
| `_T2_CONTRADICTORY_OFFSET_NOTE` | 15 | T2 contradictory (template 1) |
| `_T3_CONTRADICTORY_REVISION_BRIDGE` | 15 | T3 contradictory (template 1) |
| `_T3_CONTRADICTORY_RESOLVED_OPENER` | 15 | T3 contradictory (template 2) |
| `_CONTRADICTORY_SIGN_ASSURANCE` | 20 | T1/T2/T3 contradictory |
| `_CONTRADICTORY_RESOLUTION` | 20 | T1 contradictory (template 1) |
| `_CONTRADICTORY_PRE_FRAMING` | 20 | T2/T3 contradictory |
| `_T1_TANGENTIAL_PERIOD_OPENER` | 15 | T1 period-tangential |
| `_T1_TANGENTIAL_PERIOD_FORWARD_NOTE` | 15 | T1 period-tangential |
| `_T1_TANGENTIAL_REGION_SCOPE_NOTE` | 15 | T1 region-tangential |
| `_T2_TANGENTIAL_REGION_CLOSER` | 15 | T2 region-tangential |
| `_T2_TANGENTIAL_SUBGROUP_CLOSER` | 15 | T2 subgroup-tangential |
| `_T3_TANGENTIAL_REGION_OPENER` | 15 | T3 region-tangential |
| `_T3_TANGENTIAL_SUBGROUP_CLOSER` | 15 | T3 subgroup-tangential |
| `_T3_TANGENTIAL_PERIOD_CLOSER` | 15 | T3 period-tangential |
| `_T3_TANGENTIAL_PERIOD_ATTESTATION_INTRO` | 15 | T3 period-tangential |
| `_TANGENTIAL_COMPANION_NOTE` | 25 | T1/T2/T3 tangential |
| `_TANGENTIAL_PERIOD_LAG_NOTE` | 20 | T1 period-tangential |

---

## Test Results

```
71 passed in 0.27s
```

Full-suite check across the benchmarks module (no regressions):

```
604 passed in 1.05s
```

The four new rev2 tests:

- `test_meta_phrase_pools_exist` -- discovers and counts pools by naming
  convention; fails if anyone collapses a pool back into fixed prose.
- `test_meta_phrase_pools_minimum_variant_count` -- per-pool minimum 12
  variants. Below that floor the deck sampler cannot keep the per-variant
  ceiling under budget for high-firing pools.
- `test_no_meta_phrase_variant_exceeds_recurrence_ceiling` -- enumerates
  every plain-text variant and counts substring hits in rendered cases.
  Headline rev2 invariant. Templated variants (containing `{slot}`
  placeholders) are skipped because the deck sampler guarantees their
  fair distribution structurally even when the rendered literal differs
  per case.
- `test_rev1_heavy_offenders_are_thinned` -- backstop regression test for
  the rev1 phrases that recurred 40-70+ times. Allows up to 3× the rev2
  ceiling (i.e., 15) per substring because a single substring may
  legitimately appear inside multiple slot variants.

---

## Methodology Notes for Cross-Wedge Review

### Why deck sampling instead of pure random choice

Uniform `rng.choice` over a 15-variant pool, fired 60 times, gives an
expected per-variant count of 4 but the maximum follows a Poisson tail and
lands at ~10. To get the max under 5, the pool would need ~25 variants
(expected mean 2.4, Poisson max ~6). That doubles the slot vocabulary
without changing the actual fairness guarantee.

Deck sampling reshuffles the variant pool when exhausted, then deals
without replacement. The result is that no variant exceeds
`ceil(N_fires / pool_size) + 1` -- tight and predictable. For a pool of
15 fired 60 times, max recurrence is 4-5. The deck approach achieves the
rev2 ceiling with smaller pools and stays deterministic from the seed.

### What rev2 did NOT fix

Subject-content recurrences are unchanged. With 10 subjects across 500
cases, each subject's metric phrase (e.g. "battery-electric vehicle market
share in Norway") appears ~50 times -- once per case using that subject.
Subject-level recurrence is not a methodology-prose tell (it's the actual
content of the cases), so the cross-wedge review specifically asked for
meta-phrase variety, not subject variety.

If a future revision needs subject variety, the path is to expand the
`_SUBJECTS` tuple. The generator is structured so additional subjects
slot in cleanly.

### Subject-vs-subgroup compatibility (carried forward from rev1)

The rev1 fix renamed three subject metrics to keep the subgroup pivot
semantically valid:
- "single-family housing starts" -> "residential housing starts"
- "small-business loan applications" -> "commercial loan applications"
- "intermodal carload volume" -> "freight rail carload volume"

These remain in rev2. The spot-check reviewer should flag any case where
a metric and an off-scope subgroup are mechanically incompatible (the
tangential pivot should be a valid alternative slice, not a logical
contradiction).

---

## What the spot-check reviewer should look for

Rev2 cases should pass the spot-check at the same rate as rev1. The cases
read more naturally than rev1 because the meta-phrase variety eliminates
the "I've seen this exact sentence many times" tell. Specific things to
check:

1. **Citation plausibility.** Author / year / venue should look like a
   real reference. Rev2 did not change the citation generator.
2. **Direction-magnitude pairing.** T1 cases use exact percentages with
   direction verbs; T2 uses hedged direction-signed phrases; T3 uses
   paraphrased direction-signed phrases. Faithful cases keep direction;
   contradictory cases flip it; tangential cases keep direction but
   pivot scope.
3. **Tangential scope pivot.** The off-scope dimension (period / region /
   subgroup) should be clearly identifiable in the source excerpt.
4. **Slot-fill grammar.** Each meta-phrase variant was written to fit its
   template position. If any rendered excerpt reads as ungrammatical at
   the slot boundary, the variant is the bug, not the case label.

---

## Halting

Per spec: rev2 only; no commits; no anchoring; no sub-agents; no iteration
past rev2. This report and the artefacts above are the deliverable.
Spot-check happens after this.
