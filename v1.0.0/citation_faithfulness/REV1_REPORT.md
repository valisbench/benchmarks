# REV1 Report: citation_faithfulness Wedge

**Wedge:** `citation_faithfulness`
**Manifest version:** 1.0.0
**Status:** rev1 complete; halted per spec
**Reviewer:** Awaiting spot-check pass

---

## Files Created

| File | Purpose |
|---|---|
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/datasets/citation_faithfulness_generator.py` | Deterministic templated generator (500 cases) |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/scorers/citation_faithfulness_v1.py` | Binary F1 scorer (positive class = `unfaithful`) with subcategory metrics |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness.yaml` | Manifest YAML, model_id roster verbatim from mechanism_gap |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/cases.jsonl` | 500 generated cases |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/spot_check_review.md` | Stratified 50-case spot-check |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/spot_check_log.json` | Empty log bound to cases SHA256 |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/tests/test_citation_faithfulness.py` | Unit + structural tests (67 tests, all pass) |
| `/Users/davidlundblad/Desktop/VALIS/VALIS Claude/valis/benchmarks/manifest/v1.0.0-citation_faithfulness/REV1_REPORT.md` | This report |

---

## Generator Parameters

- **Seed:** 42
- **Count:** 500
- **Tier distribution:** uniform `(1/3, 1/3, 1/3)` (166 / 166 / 168)
- **Subcategory distribution:** `(0.5, 0.25, 0.25)` for (faithful, unfaithful-contradictory, unfaithful-tangential). Within each tier, the contradictory bucket absorbs the integer-rounding remainder so the headline-hard class is never undercounted.
- **Case ID prefix:** `citfaith` -> case IDs of the form `citfaith-tN-NNNN` with the tier in the prefix.
- **Spot-check sample seed:** 11; stratified across 9 cells (`{tier} x {subcategory}`).

### Vocabulary libraries

The generator uses ten topic bundles (`_Subject`). Each bundle pins together a metric phrase, a primary scope (region, period, subgroup), an off-scope (alternative region / period / subgroup), and a venue pool. Topics span:

1. commercial loan demand (US/EU, Q4 2025/2024, small/large firms)
2. enterprise public-cloud spend (NA/APAC, H2 2025/2024, financial-services/public-sector)
3. annual robot installations (DE/KR, 2024/2023, automotive/electronics)
4. opioid prescriptions per capita (Ohio/California, 2022/2018, 45-64/18-24)
5. freight rail carload volume (western/eastern US, March 2026/2025, container/bulk)
6. battery-electric vehicle market share (Norway/UK, Q1 2026/2025, passenger/commercial)
7. residential housing starts (southern/midwestern US, April 2026/2025, single-family/multifamily)
8. indexed peer-reviewed publications (China/US, 2024/2019, materials/biomedical)
9. apparel return rates (UK/DE, holiday 2025/2024, womenswear/menswear)
10. K-12 public-school enrollment (Texas/NY, 2024-25/2019-20 school year, K-5/9-12)

Each topic's venue pool is 5 plausible real-world publishers (Brookings, NBER, Gartner, IFR, CDC, AAR, IEA, NAR, Nature Index, NCES, etc.).

### Citation format library

35 surnames, drawn from a culturally varied pool. Four rotating citation styles:

- Style A: `Author (Year). Title. Venue.`
- Style B: `Author and Coauthor, Year, "Title," Venue.`
- Style C: `Venue, "Title," Author, Month Year.`
- Style D: `Author et al., "Title," Venue, Year.`

Ten title fragments cover the typical real-world title patterns ("Quarterly Trends in X", "X Update for Y", "Drivers of X Through the Cycle", etc.). All four styles fire at least once in the 500-case set; a dedicated test enforces this.

### Magnitude libraries

Tier-graded, direction-signed:

- T1 (exact): 10 percentage values for each direction. T1 faithful cases restate the same number verbatim; T1 contradictory cases use the same exact-percentage vocabulary but inverted direction.
- T2 (hedged): 6 phrases per direction, e.g. "near double-digit gains", "a mid-teens decline".
- T3 (paraphrased): 5 phrases per direction, e.g. "a clear deterioration from the trailing baseline".

This signed structure ensures contradictory cases pair directionally clean (claim "rose" -> source "fell"; claim "near double-digit gains" -> source "a mid-teens decline"); tangential cases keep the original direction and pivot on scope only.

---

## Dataset Hash and Cell Counts

- **cases.jsonl SHA256:** `aa32292dfac0c450cfe231dbe7d14bc75c199ae71e224ce1c8dfb53605b59010`
- **Total cases:** 500

### Per-tier / per-subcategory counts

| tier | faithful | unfaithful-contradictory | unfaithful-tangential | total |
|---:|---:|---:|---:|---:|
| 1 | 83 | 42 | 41 | 166 |
| 2 | 83 | 42 | 41 | 166 |
| 3 | 84 | 42 | 42 | 168 |
| **total** | **250** | **126** | **124** | **500** |

Binary label split: 250 faithful, 250 unfaithful. Subcategory split: 250 / 126 / 124 (~50% / 25.2% / 24.8%).

---

## Test Results

```
67 passed in 0.19s
```

Full-suite check across the benchmarks module (no regressions in pre-existing tests):

```
584 passed in 0.86s
```

Test coverage in `test_citation_faithfulness.py`:

- **Generator determinism** (3 tests): same seed -> byte-identical Python object, byte-identical JSONL serialization, different seed diverges.
- **500-case dataset properties** (5 tests): exactly 500 cases, ~167/tier, 50/50 binary, 50/25/25 subcategory, all 9 strata populated.
- **Schema** (4 tests): key set, label/subcategory consistency, case_id encoding, prefix override.
- **Prose quality** (2 tests): no double-"the" artefacts anywhere in 500 cases; claim and excerpt length thresholds.
- **Citation format plausibility** (3 tests): author + year + venue present in every citation; all four format styles fire; citation year matches the source-excerpt's stated period (catches a future regression where the citation year drifts off the source's actual coverage).
- **Scorer correctness** (24 tests): identity, golden TP/FP/FN/TN, label normalization, refusal handling, malformed handling, roster aggregation math, subcategory scoring isolation.
- **Manifest YAML structural validity** (7 tests): file exists and parses, wedge name, scorer name, case count, cases SHA256 matches committed file, roster has the three frontier models, H4 hypothesis declared with "tangential" wording.
- **Spot-check artefacts** (3 tests): cases.jsonl is 500 lines, log binds to current dataset SHA, sample is stratified across all 9 cells.

Generator/scorer integration verified: the oracle (predicts ground-truth label for every case) scores binary F1 = 1.0 and subcategory F1 = 1.0; the silent-faithful classifier (predicts "faithful" for every case) scores recall = 0.0 -- which is the H4 failure pattern.

---

## Schema-Gap: shared infra cannot validate this manifest as-is

`valis/benchmarks/manifest/schema.py` (line 55) pins the wedge field to `Literal["phantom_precision", "mechanism_gap"]`. The hard constraint in the assignment forbids modifying that file. The manifest YAML for this wedge is structurally valid and the SHA-binding mechanism works, but `load_manifest()` cannot currently parse it because Pydantic will reject the literal.

This is a documented infrastructure gap, not a manifest defect. To unblock loading, the parent agent (or the shared-infra owner) needs to widen the `Literal` to include `citation_faithfulness` and the other two new wedge names being built in parallel (wedges 3, 5, 6). Recommended one-line edit:

```python
# valis/benchmarks/manifest/schema.py, line ~55
wedge: Literal[
    "phantom_precision",
    "mechanism_gap",
    "citation_faithfulness",
    # ... whatever the parallel agents are also defining
]
```

This wedge's manifest tests pass against the YAML literal directly (using `yaml.safe_load`), so the regression is caught structurally without depending on the schema's validator. Once the schema is widened, `load_manifest()` calls will work without changing the YAML.

---

## Known Limitations and Methodology Questions for Cross-Wedge Review

### "Plausible publication text" rigor

This is the hardest part of the wedge per the spec, and the part most likely to need polish in a later rev. The generator's approach:

- **Source excerpts** read in the voice of a research / consulting analyst note: methodology references, "the working group", "the methodology room", "the standard reconciliation", parenthetical revisions, "robust to the standard exclusions". The vocabulary is deliberately polysyllabic and hedged to mimic real publication prose without veering into AI-slop tells. Tone is consistent within each tier (T1 is more direct, T3 is more hedged, mirroring how published work actually scales).
- **Citation strings** rotate among four styles drawn from observed real-world patterns: dotted parens (working-paper style), comma-separated quoted titles (journal style), venue-led releases (consulting style), `et al.` (high-author-count style). Surnames are sampled from a culturally varied 35-name pool to avoid the "everyone is Smith or Johnson" tell. Venue pools per topic are pulled from the publishers that actually cover those topics in real life.

**What a careful spot-check reviewer might catch and flag as a template tell:**

- The same handful of meta-phrases (`"the standard caveats around revisions"`, `"the methodology room"`, `"the working group"`) recur across cases of the same tier and subcategory. A reviewer reading 50 cases at once will notice this. A model evaluating one case at a time should not.
- T3 paraphrased magnitude phrases ("a clear deterioration from the trailing baseline") read as paraphrase rather than as a direct citation of a real publication's wording. Real publications often quote specific numbers somewhere; T3 deliberately strips them.

These are acceptable v1 trade-offs given the wedge is testing model behaviour on (claim, citation, source) triples, not testing whether a careful reader can distinguish synthetic prose from real prose. If a reviewer marks <80% pass rate on the source-plausibility criterion, the templates need expansion (more meta-phrase variety, more diverse closing sentences).

### Subgroup-metric compatibility

Initial generation produced cases where the metric and the off-scope subgroup were logically incompatible (e.g., "single-family housing starts" restricted to "multifamily structures"). The fix narrowed the metric vocabulary so both subgroups can plausibly slice the metric:

- `residential housing starts` (was `single-family housing starts`) so both `single-family detached homes` and `multifamily structures` are valid subgroups.
- `commercial loan applications` (was `small-business loan applications`) so both small and large firms can be subgroups.
- `freight rail carload volume` (was `intermodal carload volume`) so both `container traffic` and `bulk commodity traffic` are valid subgroups.

This is a methodology question for cross-wedge review: should the tangential trap include some "egregious" cases where the metric and the off-scope subgroup are mechanically incompatible (a different flavour of unfaithfulness), or should every tangential case be a "valid alternative slice"? rev1 picked the latter -- valid-alternative-slice is the harder trap and matches the design hypothesis (lexical overlap is the trap, not logical contradiction).

### Tier 1 contradictory magnitude pairings

T1 contradictory cases pair a claim direction-magnitude with a source direction-magnitude where both directions are flipped but magnitudes are sampled independently from the same exact-percentage pool. This produces pairings like "claim: 9.7% up, source: 8% down" (sign flipped, magnitude different). The contradiction is unambiguous because the direction word ("rose"/"fell") flips; the magnitude difference is incidental. If a spot-check reviewer flags this as "the magnitudes don't match, so this could be tangential not contradictory" -- the rebuttal is that T1 contradictory is about direction, not about precise-magnitude match. A future rev could optionally force magnitude equality on T1 contradictory pairs to make the contradiction even more crisp.

### What rev1 did NOT do

- **No spot-check verdicts**: The log is empty per spec. The reviewer will run the spot-check protocol after rev1 hands off.
- **No retries / multi-rev iteration**: stopped at rev1 per hard constraint.
- **No anchoring**: the manifest is unsigned per hard constraint.
- **No engine integration**: the harness, anchoring, and validation modules are shared infra and were not touched.

---

## Spec Ambiguities and How They Were Resolved

1. **"Plausible real publication references with author, year, title, source venue"** -- resolved by rotating four real-world citation styles (Style A through D). Each style includes author, year (4-digit), title, and venue; all four fire at least once in the 500-case set.

2. **Tier × subcategory stratification for the spot-check** -- the spec says "stratify across the 3 label categories AND 3 tiers" which gives 9 strata, not 6. Resolved by concatenating tier and subcategory into a single strata key (`t{tier}-{subcategory}`) and using `spot_check.pick_sample` with that key function. Each of the 9 cells gets at least 4 cases in the 50-case sample (most get 5, some 6). A test enforces this.

3. **Subcategory metric definition** -- the spec says "subcategory metrics reported separately: F1 on contradictory subset, F1 on tangential subset". Resolved by computing each subcategory F1 against (that subcategory's positives) plus (the full faithful negative set). Without including the faithful negatives, subcategory precision would always be 1.0 (no negatives to mistake for positives), making the metric meaningless. Documented in the scorer's `SubcategoryScore` docstring.

4. **Citation year stamping on tangential-period cases** -- the citation year should reflect what the source ACTUALLY covers, not what the claim covers, because that is how real-world citations work. So a period-pivot tangential case where the source covers Q4 2024 instead of Q4 2025 stamps the citation as 2024. A test enforces that the citation year appears in the source excerpt.

5. **Refusal handling** -- per spec "identical to mechanism_gap". The scorer copies the `mechanism_gap_v1` refusal contract: refusal as a separate outcome category, F1 over non-refused only; refusal trumps malformed.

---

## Halting

Per hard constraints: rev1 only; no commits; no anchoring; no sub-agents; no iteration. This report and the artefacts above are the deliverable. Cross-wedge review and spot-check happen elsewhere.
