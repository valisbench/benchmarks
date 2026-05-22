# Spot-Check Verdicts -- Opus 4.7

Dataset: citation_faithfulness v1.0.0
Dataset SHA: 9982d7e97ed4535695cf4e0517bb9c64bffce6f30fe09a461867ac796c8d6584
Reviewer: Claude Opus 4.7

## citfaith-t3-0123
Verdict: pass
Reasoning: Same metric (K-12 public-school enrollment), same region (Texas), same period (2024-25), same subgroup (K-5); both claim and source agree on softening/deterioration; faithful label correct.

## citfaith-t3-0081
Verdict: pass
Reasoning: Claim asserts North America scope but source explicitly states "the geography covered by this specific update is Asia-Pacific"; classic tangential mismatch, correctly unfaithful-tangential.

## citfaith-t2-0459
Verdict: pass
Reasoning: Claim asserts low-teens growth but source states mid-teens decline -- direct sign reversal on same metric/region/period/subgroup; correctly unfaithful-contradictory.

## citfaith-t1-0192
Verdict: pass
Reasoning: Identical metric, region, period, and subgroup with matching direction (rose/increased) and magnitude (22%); citation and excerpt both publication-grade; faithful label correct.

## citfaith-t1-0370
Verdict: pass
Reasoning: Claim asserts southern US but source covers midwestern US; same metric and period but explicitly different region; correctly unfaithful-tangential.

## citfaith-t3-0451
Verdict: pass
Reasoning: Claim asserts clear recovery but source asserts measurable contraction on same BEV market share metric/region/period/subgroup; correctly unfaithful-contradictory.

## citfaith-t1-0104
Verdict: pass
Reasoning: Identical metric, region, period; both report 5.4% growth; faithful label correct, source excerpt and citation both plausible.

## citfaith-t1-0105
Verdict: pass
Reasoning: Claim asserts 11% growth but source explicitly states "declined by 22%" on same metric/region/period; correctly unfaithful-contradictory.

## citfaith-t2-0316
Verdict: pass
Reasoning: Claim asserts near double-digit gains but source asserts low-teens contraction on enterprise public-cloud spend / North America / H2 2025 / financial-services buyers; sign reversal, correctly unfaithful-contradictory.

## citfaith-t3-0110
Verdict: pass
Reasoning: Claim asserts discernible firming but source asserts discernible softening on same metric/region/period/subgroup; sign reversal, correctly unfaithful-contradictory.

## citfaith-t3-0151
Verdict: pass
Reasoning: Claim and source agree on marked weakening/discernible softening direction for BEV market share in Norway, Q1 2026, new passenger-car sales; faithful label correct.

## citfaith-t3-0402
Verdict: pass
Reasoning: Claim asserts marked weakening from comparable window; source asserts notable retracement from recent highs on same metric/region/period/subgroup; direction matches, faithful holds.

## citfaith-t2-0340
Verdict: pass
Reasoning: Claim asserts Germany scope but source explicitly states "this release focuses on South Korea"; correctly unfaithful-tangential.

## citfaith-t2-0495
Verdict: pass
Reasoning: Both claim (high-single-digit softening) and source (low-teens contraction) report declines on apparel return rates / UK / holiday 2025 / womenswear; direction matches and magnitude bands are adjacent within typical revision tolerance; faithful holds.

## citfaith-t1-0347
Verdict: pass
Reasoning: Claim asserts 14% climb but source states "fell by 22%" -- direct opposite direction on opioid prescriptions per capita / Ohio / 2022; correctly unfaithful-contradictory.

## citfaith-t3-0386
Verdict: pass
Reasoning: Both claim and source describe expansion/improvement on indexed peer-reviewed publications / China / 2024 / materials-science venues; direction matches, faithful holds.

## citfaith-t2-0421
Verdict: pass
Reasoning: Claim asserts Norway scope but source explicitly states "this release focuses on the United Kingdom"; correctly unfaithful-tangential.

## citfaith-t1-0178
Verdict: pass
Reasoning: Claim asserts 2024-25 school year but source explicitly reports the 2019-20 school year reading -- different period; correctly unfaithful-tangential.

## citfaith-t2-0475
Verdict: pass
Reasoning: Claim asserts China scope but source explicitly states "this release focuses on the United States"; correctly unfaithful-tangential.

## citfaith-t3-0406
Verdict: pass
Reasoning: Claim asserts Germany scope but source states "the geography covered by this specific update is South Korea"; correctly unfaithful-tangential.

## citfaith-t3-0001
Verdict: pass
Reasoning: Claim asserts discernible softening but source asserts meaningful step up on Texas K-12 enrollment 2024-25; sign reversal, correctly unfaithful-contradictory.

## citfaith-t2-0224
Verdict: pass
Reasoning: Claim asserts low-teens contraction but source asserts low-teens percentage growth on opioid prescriptions / Ohio / 2022 / adults 45-64; sign reversal, correctly unfaithful-contradictory.

## citfaith-t3-0168
Verdict: pass
Reasoning: Claim asserts marked weakening but source asserts marked improvement on freight rail carload volume / western US / March 2026 / container traffic; sign reversal, correctly unfaithful-contradictory.

## citfaith-t2-0199
Verdict: pass
Reasoning: Claim asserts high-single-digit softening but source asserts near double-digit gains on apparel return rates / UK / holiday 2025 / womenswear; sign reversal, correctly unfaithful-contradictory.

## citfaith-t3-0147
Verdict: pass
Reasoning: Claim asserts new passenger-car sales subgroup but source explicitly states that subgroup is out of scope ("queued for the next standalone release") and covers commercial light-duty sales instead; correctly unfaithful-tangential.

## citfaith-t2-0285
Verdict: pass
Reasoning: Both claim and source report modest single-digit weakness on apparel return rates / UK / holiday 2025 / womenswear; direction and magnitude band match exactly; faithful holds.

## citfaith-t2-0492
Verdict: pass
Reasoning: Claim asserts low-teens contraction but source asserts low-teens percentage growth on apparel return rates / UK / holiday 2025 / womenswear; sign reversal, correctly unfaithful-contradictory.

## citfaith-t1-0339
Verdict: pass
Reasoning: Claim says "softened by 31%" and source says "fell by 31%" on same metric/region/period; direction and magnitude both match precisely; faithful holds.

## citfaith-t1-0040
Verdict: pass
Reasoning: Claim asserts 2024 but source explicitly states "the reading set out here is the 2023 figure" on annual robot installations / Germany; different period, correctly unfaithful-tangential.

## citfaith-t2-0072
Verdict: pass
Reasoning: Claim asserts near double-digit gains and source asserts low-twenties percentage gains on indexed peer-reviewed publications / China / 2024 / materials-science venues; both are gains in same direction with magnitudes in adjacent bands; faithful per the dataset's tolerance.

## citfaith-t1-0445
Verdict: pass
Reasoning: Claim asserts 5.4% increase but source asserts 8% decline on indexed peer-reviewed publications / China / 2024; sign reversal, correctly unfaithful-contradictory.

## citfaith-t2-0390
Verdict: pass
Reasoning: Claim asserts low-teens contraction and source asserts high-single-digit softening on indexed peer-reviewed publications / China / 2024 / materials-science venues; both declines in adjacent magnitude bands; faithful holds.

## citfaith-t3-0122
Verdict: pass
Reasoning: Claim asserts Ohio scope but source states "the geography covered by this specific update is California"; correctly unfaithful-tangential.

## citfaith-t2-0250
Verdict: pass
Reasoning: Claim asserts low-teens percentage growth and source asserts modest single-digit growth on opioid prescriptions / Ohio / 2022 / adults 45-64; both growth in adjacent magnitude bands; faithful holds.

## citfaith-t1-0171
Verdict: pass
Reasoning: Identical metric, region, period; both report 8% decline/fall on opioid prescriptions / Ohio / 2022; direction and magnitude match precisely; faithful holds.

## citfaith-t1-0332
Verdict: pass
Reasoning: Claim asserts April 2026 but source explicitly states "the figure highlighted in this brief covers April 2025"; different period, correctly unfaithful-tangential.

## citfaith-t1-0129
Verdict: pass
Reasoning: Claim asserts 22% softening but source states "rose by 31%" on BEV market share / Norway / Q1 2026; sign reversal, correctly unfaithful-contradictory.

## citfaith-t3-0254
Verdict: pass
Reasoning: Claim asserts holiday season 2025 but source states "window covered: holiday season 2024"; different period, correctly unfaithful-tangential.

## citfaith-t1-0058
Verdict: pass
Reasoning: Identical metric, region, period; both report 14% decline/fall on enterprise public-cloud spend / North America / H2 2025; faithful holds.

## citfaith-t3-0465
Verdict: pass
Reasoning: Claim asserts marked improvement but source asserts clear deterioration on indexed peer-reviewed publications / China / 2024 / materials-science venues; sign reversal, correctly unfaithful-contradictory.

## citfaith-t1-0389
Verdict: pass
Reasoning: Claim asserts 5.4% rise but source asserts series "softened by 5.4%" on BEV market share / Norway / Q1 2026; sign reversal with same magnitude, correctly unfaithful-contradictory.

## citfaith-t1-0476
Verdict: pass
Reasoning: Claim asserts 2024 but source covers 2023 explicitly ("this update covers the 2023 window"); different period, correctly unfaithful-tangential.

## citfaith-t1-0039
Verdict: pass
Reasoning: Identical metric, region, period; both report 8% increase/climb on opioid prescriptions / Ohio / 2022; direction and magnitude match precisely; faithful holds.

## citfaith-t3-0374
Verdict: pass
Reasoning: Both claim and source report discernible softening on enterprise public-cloud spend / North America / H2 2025 / financial-services buyers; direction matches exactly; faithful holds.

## citfaith-t2-0366
Verdict: pass
Reasoning: Claim asserts low-twenties percentage gains but source asserts high-single-digit softening on apparel return rates / UK / holiday 2025 / womenswear; sign reversal, correctly unfaithful-contradictory.

## citfaith-t1-0327
Verdict: pass
Reasoning: Claim asserts North America scope but source explicitly states "Our update focuses on Asia-Pacific"; correctly unfaithful-tangential.

## citfaith-t1-0010
Verdict: pass
Reasoning: Claim asserts 22% fall but source asserts 12.3% rise on indexed peer-reviewed publications / China / 2024; sign reversal, correctly unfaithful-contradictory.

## citfaith-t2-0274
Verdict: pass
Reasoning: Claim asserts double-digit decline and source asserts upper-single-digit fall on indexed peer-reviewed publications / China / 2024 / materials-science venues; both declines in adjacent magnitude bands; faithful holds.

## citfaith-t2-0141
Verdict: pass
Reasoning: Claim asserts Norway scope but source states "this release focuses on the United Kingdom"; correctly unfaithful-tangential.

## citfaith-t2-0360
Verdict: pass
Reasoning: Claim asserts container traffic subgroup but source explicitly states "the component covering container traffic appears in a separate sibling note and is not the basis of the headline number reported here"; different subgroup, correctly unfaithful-tangential.
