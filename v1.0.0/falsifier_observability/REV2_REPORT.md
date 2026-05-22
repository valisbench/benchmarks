# REV2 Report -- falsifier_observability v1.0.0

Author: Claude (Opus 4.7) building agent
Date: 2026-05-21
Status: rev2 complete -- halting per spot-check gate
Supersedes: REV1_REPORT (renamed to this file)

---

## What changed in rev2

Three substantive changes, plus follow-on artifact regeneration and three new tests:

### 1. Sentence uniqueness pass (97.8% from 91.6%)

The rev1 uniqueness diagnostic showed 458/500 unique sentences with the hot spots in low-cross-product templates: tier-1 stated_unfalsifiable (69/83 unique, 14 dupes) and tier-2 stated_unfalsifiable (59/83 unique, 24 dupes). The 24 dupes in tier-2 unfalsifiable came primarily from two single-slot templates with 8-unique cross-products: `"The team expects meaningful progress, {macro_condition}."` and `"We are well-positioned for the next phase, {macro_condition}."`.

Rev2 changes:

- **Slot library expansion.** Five libraries expanded from 8 to 14 fills each (adaptation_framing went from 6 to 12):
  - `plan_subject` and `plan_subject_mid`: added "Our investment plan", "Our annual plan", "Our strategic direction", "Our operating posture", "Our portfolio bet", "Our long-term plan" (and lowercase variants).
  - `macro_condition`: added "assuming the rate environment cooperates", "if the buyer side keeps spending", "provided the IPO window reopens on the expected timeline", "as long as enterprise budgets hold", "if the AI capex cycle continues at current pace", "provided the labor market stays soft enough".
  - `unfalsifiable_predicate`: added six new self-sealing predicates ("will hold up under whatever the next chapter looks like", "is the right posture for the road ahead", etc.).
  - `vague_direction`: added six new directional-but-uncheckable claims ("is appreciably stronger than at the start of the year", "is more credibly differentiated than a year ago", etc.).
  - `adaptation_framing`: added six new flexibility predicates ("will recalibrate as the operating picture sharpens", etc.).
- **Tier-2 unfalsifiable template rewrites.** Replaced the two single-slot templates with two-slot variants that pull a `plan_subject` or `plan_subject_mid`. The two new templates: `"The team expects {plan_subject_mid} to make meaningful progress, {macro_condition}."` and `"{plan_subject} is well-positioned for the next phase, {macro_condition}."`. Same semantic intent (vacuous progress claim + macro-condition framing), grammatically clean, but each now has a 14 x 14 = 196 cross-product instead of 14.

**Result:** 489/500 unique sentences (97.8%), above the 95% target. Per-(tier, label) breakdown:

| Tier | Label | Rev1 unique | Rev2 unique |
|---|---|---|---|
| 1 | observable_falsifier | 82/83 | 82/83 |
| 1 | stated_unfalsifiable | 69/83 | 78/83 |
| 2 | observable_falsifier | 83/83 | 83/83 |
| 2 | stated_unfalsifiable | 59/83 | 79/83 |
| 3 | observable_falsifier | 83/84 | 83/84 |
| 3 | stated_unfalsifiable | 82/84 | 84/84 |

### 2. T3 grammatical-ambiguity check (passed, no changes)

Walked 10 tier-3 cases at seed=42, 5 observable_falsifier + 5 stated_unfalsifiable, sampled by `random.Random(0).sample()` on the relevant tier+label subset:

- 5 observable: 0279, 0319, 0030, 0185, 0398. All syntactically clean. Heavy hedges nest correctly; the falsifiable core (metric + threshold + date) survives every wrapping.
- 5 unfalsifiable: 0380, 0302, 0213, 0360, 0274. All syntactically clean. Decoy-metric templates (e.g. "the strategic positioning of our X is improving across the relevant dimensions") read grammatically; the meaning is hedged-and-unfalsifiable by design.

No template fixes needed. The rev1 decoy-metric construction holds up under direct grammatical inspection.

### 3. Manifest validation tests added

Three new tests landed against the now-widened shared schema (`schema.py` wedge Literal expanded by main session to include falsifier_observability):

- `test_manifest_yaml_validates_through_shared_schema` -- the on-disk YAML round-trips through `load_manifest()` cleanly; assertion on wedge, case_count, scorer, metric, roster providers, and hypothesis id.
- `test_manifest_cases_sha256_matches_on_disk_cases_file` -- the manifest's `cases_sha256` MUST match the SHA of the file it references. This is the pre-registration binding; any drift invalidates the manifest.
- `test_manifest_cases_file_line_count_matches_case_count` -- `case_count` MUST equal the number of lines in `cases.jsonl`. Defensive against partial regenerates.

Updated `test_generator_sentence_uniqueness_at_500_is_high` floor from 375 (75%) to 475 (95%).

---

## New cases SHA256

`dc9fcf93e631a05e20e1dad07f162a38e071cbcf371d91de8d7b10d5d612096e`

(rev1 was `d0e154e51c3b49847403873e157d4ca4921ac7800683982ee757146c664517b7`)

Manifest YAML's `cases_sha256` updated to the new value. Spot-check log's `dataset_sha256` updated. Spot-check review file regenerated against new sample (same seed=7, but the underlying cases changed so the 50 case_ids are different from rev1).

Per-tier per-label counts unchanged: 83/83/83/83/84/84. Total 500.

---

## Files modified or regenerated

| File | Change |
|---|---|
| `valis/benchmarks/datasets/falsifier_observability_generator.py` | Slot libraries expanded; two tier-2-unfalsifiable templates rewritten. |
| `valis/benchmarks/manifest/v1.0.0-falsifier_observability.yaml` | `cases_sha256` updated. |
| `valis/benchmarks/manifest/v1.0.0-falsifier_observability/cases.jsonl` | Regenerated, same seed=42. |
| `valis/benchmarks/manifest/v1.0.0-falsifier_observability/spot_check_log.json` | New empty log bound to new SHA, new 50-case sample (seed=7 against new cases). |
| `valis/benchmarks/manifest/v1.0.0-falsifier_observability/spot_check_review.md` | Regenerated against new sample. |
| `valis/benchmarks/tests/test_falsifier_observability.py` | Uniqueness floor raised to 95%; 3 new manifest-validation tests added (57 total). |

No other files touched. No shared infrastructure modified.

---

## Test results

```
$ PYTHONPATH=. /usr/bin/python3 -m pytest valis/benchmarks/tests/test_falsifier_observability.py
============================== 57 passed in 0.16s ==============================
```

Full benchmarks suite (across all wedges) at rev2 sync: `587 passed in 0.93s`.

Coverage delta from rev1:

- +1 raised uniqueness floor (was 375, now 475)
- +1 manifest YAML validates through `load_manifest()`
- +1 manifest cases_sha256 binds to on-disk file
- +1 manifest case_count matches cases.jsonl line count

---

## Generator parameters (unchanged from rev1)

- Seed: **42**
- Count: **500**
- case_id_prefix: `falsobs`
- Tier distribution: `(1/3, 1/3, 1/3)` -> 166/166/168
- Per-tier label split: 50/50, extra goes to stated_unfalsifiable on odd counts (per mechanism_gap convention)

---

## Halt for spot-check gate

Rev2 complete. The wedge is ready for the 50-case spot-check pass. The new sample IDs are in `spot_check_log.json`; the review file is empty (no verdicts) and bound to the new dataset SHA.

If the spot-check finds <48/50 pass, rev3 fixes the surfaced cases. Otherwise the wedge ships in the v1.0.0 batch.

Per task constraints: nothing committed, pushed, or anchored. No shared infrastructure modified. No sub-agents spawned.
