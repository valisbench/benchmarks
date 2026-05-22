# Spot-Check Review: citation_faithfulness v1.0.0 (rev2)

Dataset SHA256: `9982d7e97ed4535695cf4e0517bb9c64bffce6f30fe09a461867ac796c8d6584`
Sample size: 50
Sample seed: 11
Reviewer: david.lundblad@gmail.com

Rev2: regenerated after meta-phrase variety pass. No meta-phrase variant
now appears in more than 5 cases across the full 500-case set (rev1 had
variants recurring 40-70+ times). Subcategory denominator note added to
manifest rubric.

For each (claim, citation, source_excerpt) triple, judge whether the ground-truth label
(`faithful` or `unfaithful`) holds under a careful independent read.

- **faithful**: the source excerpt genuinely supports the claim. The two refer
  to the same metric, the same region, the same period, and the same subgroup,
  and the source's direction and magnitude line up with the claim's.
- **unfaithful**: the source either contradicts the claim (`unfaithful-
  contradictory`) or addresses a different scope while sharing vocabulary
  (`unfaithful-tangential`).

Mark **pass** if the ground-truth label matches your judgment AND the source
excerpt reads as plausible publication text AND the citation looks like a real-
world reference. Mark **fail** if any of those three fail.

Record verdicts via:
```python
from valis.benchmarks.validation import spot_check as sc
log = sc.deserialize(open('spot_check_log.json').read())
log = sc.record_verdict(log, case_id='citfaith-tN-NNNN', verdict='pass', notes='...')
open('spot_check_log.json','w').write(sc.serialize(log))
```

---

## 1. citfaith-t3-0123 (tier 3, faithful)

**Claim:**

> Industry observers tracking grades K through 5 have noted that K-12 public-school enrollment across Texas delivered a discernible softening versus the antecedent quarter during the 2024-25 school year, though attribution remains debated.

**Citation:**

> Fitzgerald (2024). Forecasting K-12 Public-school Enrollment: Methods and Findings. Texas Education Agency Annual Statistical Report.

**Source excerpt:**

> The figure the team publishes here, drawn from the production-grade dataset, suggests that K-12 public-school enrollment across Texas during the 2024-25 school year reflected a clear deterioration from the trailing baseline. The figure aligns directionally with the parallel reads circulated during the pre-publication review and, when the sample is restricted to grades K through 5, the resulting movement is moving with the headline within the usual cross-source variation.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 2. citfaith-t3-0081 (tier 3, unfaithful-tangential)

**Claim:**

> Industry observers tracking financial-services buyers have noted that enterprise public-cloud spend across North America delivered a clear deterioration from the trailing baseline during the second half of 2025, though attribution remains debated.

**Citation:**

> Bianchi (2025). Quarterly Trends in Enterprise Public-cloud Spend. 451 Research Voice of the Enterprise.

**Source excerpt:**

> After the multi-pass reconciliation against the underlying inputs, our team's reading is that enterprise public-cloud spend produced a marked weakening from the comparable window during the second half of 2025. The figure carries the standard qualifications about provisional vintages and reweighting, and the component covering financial-services buyers is lining up with the headline read inside the customary margin (the geography covered by this specific update is Asia-Pacific; a companion NA release is in preparation).

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 3. citfaith-t2-0459 (tier 2, unfaithful-contradictory)

**Claim:**

> Within Texas, K-12 public-school enrollment showed low-teens percentage growth in the 2024-25 school year, consistent with sector-wide patterns observed in grades K through 5.

**Citation:**

> Quintero and Xu, 2024, "Sectoral Patterns of K-12 Public-school Enrollment," Urban Institute Education Research Brief.

**Source excerpt:**

> Although there is meaningful within-period variation, the full 2024-25 school year reading for Texas shows K-12 public-school enrollment producing a mid-teens decline. The component covering grades K through 5 contributes the largest share of that movement, with no plausible methodological adjustment that would flip the sign back to the direction reported in earlier coverage.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 4. citfaith-t1-0192 (tier 1, faithful)

**Claim:**

> In holiday season 2025, apparel return rates in the UK domestic market rose by 22%.

**Citation:**

> Alvarez et al., "Sectoral Patterns of Apparel Return Rates," GlobalData Retail Quarterly, 2025.

**Source excerpt:**

> Our updated dataset confirms that during holiday season 2025, apparel return rates in the UK domestic market increased by 22%, in agreement with the alternative-source cross-check. The series uses the same compilation conventions as the previous release; no methodology change affects the period under review.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 5. citfaith-t1-0370 (tier 1, unfaithful-tangential)

**Claim:**

> Residential housing starts in the southern US grew by 31% during April 2026.

**Citation:**

> Chowdhury et al., "Sectoral Patterns of Residential Housing Starts," Wells Fargo Economics Group Weekly, 2026.

**Source excerpt:**

> Our update focuses on the midwestern US, where residential housing starts climbed by 18.6% during April 2026. Coverage of the South figure falls outside this release and is queued for the next monthly release once the data lag closes.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 6. citfaith-t3-0451 (tier 3, unfaithful-contradictory)

**Claim:**

> Despite headwinds in adjacent sectors, battery-electric vehicle market share in Norway registered a clear recovery from the trailing baseline through the first quarter of 2026, particularly within new passenger-car sales.

**Citation:**

> Fitzgerald et al., "Quarterly Trends in Battery-electric Vehicle Market Share," Transport & Environment Briefing Paper, 2026.

**Source excerpt:**

> After the routine reconciliation pass and the desk's standard revisions, our reading is that battery-electric vehicle market share in Norway over the first quarter of 2026 ultimately reflected a measurable contraction against the prior reading. The component covering new passenger-car sales moved with the aggregate, with no defensible methodology alternative that flips the sign back.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 7. citfaith-t1-0104 (tier 1, faithful)

**Claim:**

> In Q4 2025, commercial loan applications in the United States grew by 5.4%.

**Citation:**

> Engelhart (2025). Cross-Country Dynamics of Commercial Loan Applications. NBER Working Paper Series.

**Source excerpt:**

> Our final reading is unchanged from the preliminary publication: commercial loan applications in the United States grew by 5.4% during Q4 2025. The direction is consistent with peer reports and the magnitude is within the range of variation the underlying series has exhibited across the last several reporting cycles.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 8. citfaith-t1-0105 (tier 1, unfaithful-contradictory)

**Claim:**

> In March 2026, freight rail carload volume in the western US network grew by 11%.

**Citation:**

> Zelenko and Delacroix, 2026, "Quarterly Trends in Freight Rail Carload Volume," Cowen Rail Equity Research Note.

**Source excerpt:**

> Against the broader narrative in commentary, the underlying series shows that the opposite headline holds. During March 2026, freight rail carload volume in the western US network declined by 22%, with no decomposition we have tried that recovers the opposite direction.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 9. citfaith-t2-0316 (tier 2, unfaithful-contradictory)

**Claim:**

> Across financial-services buyers in North America, enterprise public-cloud spend posted near double-digit gains during the second half of 2025, continuing a multi-quarter trend.

**Citation:**

> Helgesen and Johansson, 2025, "Drivers of Enterprise Public-cloud Spend Through the Cycle," IDC FutureScape Worldwide Cloud Services.

**Source excerpt:**

> Although there is meaningful within-period variation, the full second half of 2025 reading for North America shows enterprise public-cloud spend producing a low-teens contraction. The component covering financial-services buyers contributes the largest share of that movement, and no revision we have run reverses the headline sign once consistently applied.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 10. citfaith-t3-0110 (tier 3, unfaithful-contradictory)

**Claim:**

> Industry observers tracking financial-services buyers have noted that enterprise public-cloud spend across North America delivered a discernible firming versus the antecedent quarter during the second half of 2025, though attribution remains debated.

**Citation:**

> Helgesen and Okafor, 2025, "Cross-Country Dynamics of Enterprise Public-cloud Spend," IDC FutureScape Worldwide Cloud Services.

**Source excerpt:**

> Once the standard revisions and the desk's reconciliation are applied, our reading is that enterprise public-cloud spend in North America over the second half of 2025 ultimately reflected a discernible softening versus the antecedent quarter. The component covering financial-services buyers moved with the aggregate, and no candidate alternative weighting flips the sign back to what earlier coverage cited.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 11. citfaith-t3-0151 (tier 3, faithful)

**Claim:**

> Industry observers tracking new passenger-car sales have noted that battery-electric vehicle market share across Norway delivered a marked weakening from the comparable window during the first quarter of 2026, though attribution remains debated.

**Citation:**

> Transport & Environment Briefing Paper, "Forecasting Battery-electric Vehicle Market Share: Methods and Findings," Zelenko, January 2026.

**Source excerpt:**

> Working from the panel-of-record published last cycle, our quantitative team finds that battery-electric vehicle market share in Norway produced a discernible softening versus the antecedent quarter over the first quarter of 2026. The estimate carries the customary cautions about pending source revisions and rebasing windows, but the core read for new passenger-car sales is agreeing with the main conclusion and in line with the smoothed nowcast over the comparable window that the standards desk attested under the usual sign-off.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 12. citfaith-t3-0402 (tier 3, faithful)

**Claim:**

> Industry observers tracking new passenger-car sales have noted that battery-electric vehicle market share across Norway delivered a marked weakening from the comparable window during the first quarter of 2026, though attribution remains debated.

**Citation:**

> Devereux and Chowdhury, 2026, "Cross-Country Dynamics of Battery-electric Vehicle Market Share," Transport & Environment Briefing Paper.

**Source excerpt:**

> The estimate the team has settled on, based on the reconciled cross-source panel, indicates that battery-electric vehicle market share across Norway during the first quarter of 2026 reflected a notable retracement from recent highs. The figure aligns directionally with the comparator estimates the methodology desk validated and, when the sample is restricted to new passenger-car sales, the resulting movement is moving with the aggregate inside the routine measurement band.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 13. citfaith-t2-0340 (tier 2, unfaithful-tangential)

**Claim:**

> Within Germany, annual robot installations showed an upper-single-digit fall in 2024, consistent with sector-wide patterns observed in the automotive sector.

**Citation:**

> VDMA Robotik + Automation Annual Report, "Drivers of Annual Robot Installations Through the Cycle," Ramaswamy, November 2024.

**Source excerpt:**

> While related work covers Germany, this release focuses on South Korea. Within that geography, annual robot installations delivered double-digit decline during 2024. The DE reading will be addressed in a separate update; the underlying source data overlap, but the headline reported here is scoped to the KR sample only.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 14. citfaith-t2-0495 (tier 2, faithful)

**Claim:**

> Within the UK domestic market, apparel return rates showed high-single-digit softening in holiday season 2025, consistent with sector-wide patterns observed in womenswear.

**Citation:**

> Iversen (2025). Forecasting Apparel Return Rates: Methods and Findings. Retail Economics UK Industry Outlook.

**Source excerpt:**

> Looking across the UK domestic market, apparel return rates produced a low-teens contraction over holiday season 2025, with womenswear moving with the broader figure inside the customary noise band. This figure continues the trend visible across recent comparable periods, and no methodology adjustments affect the published reading.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 15. citfaith-t1-0347 (tier 1, unfaithful-contradictory)

**Claim:**

> In 2022, opioid prescriptions per capita in Ohio climbed by 14%.

**Citation:**

> Imamura and Yamashita, 2022, "Estimating Opioid Prescriptions Per Capita Under Revised Methodology," JAMA Network Open Original Investigation.

**Source excerpt:**

> Against the framing in recent coverage, the underlying series shows that during 2022, opioid prescriptions per capita in Ohio moved in the opposite direction: the series fell by 22%. The headline size lines up with the figure previously circulated, but with the headline carrying the opposite sign once the revisions land.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 16. citfaith-t3-0386 (tier 3, faithful)

**Claim:**

> Despite headwinds in adjacent sectors, indexed peer-reviewed publications in China registered a marked improvement relative to the comparable window through 2024, particularly within materials-science venues.

**Citation:**

> Vasconcelos (2024). A Decomposition of Indexed Peer-reviewed Publications Across Regions. OECD Science and Technology Indicators.

**Source excerpt:**

> Pulling from the harmonised quarterly panel, our updated reading is that indexed peer-reviewed publications in China produced a measurable expansion against the prior reading over 2024. The estimate carries the standard qualifications about provisional vintages and reweighting, but the core read for materials-science venues is aligned with the primary finding and agreeing with the slope visible in the corresponding nowcast series that the publication pipeline signed off after the standard checks.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 17. citfaith-t2-0421 (tier 2, unfaithful-tangential)

**Claim:**

> Across new passenger-car sales in Norway, battery-electric vehicle market share posted modest single-digit weakness during the first quarter of 2026, continuing a multi-quarter trend.

**Citation:**

> International Energy Agency Global EV Outlook, "A Decomposition of Battery-electric Vehicle Market Share Across Regions," Iversen, September 2026.

**Source excerpt:**

> While related work covers Norway, this release focuses on the United Kingdom. Within that geography, battery-electric vehicle market share delivered an upper-single-digit fall during the first quarter of 2026. The Norway reading is set out in a sibling parallel update; the underlying data sources overlap, but this release scopes the headline to UK only.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 18. citfaith-t1-0178 (tier 1, unfaithful-tangential)

**Claim:**

> K-12 public-school enrollment in Texas increased by 14% during the 2024-25 school year.

**Citation:**

> Devereux et al., "Forecasting K-12 Public-school Enrollment: Methods and Findings," National Center for Education Statistics Common Core Data, 2019.

**Source excerpt:**

> The published figure in this update is the 2019-20 school year reading and not the more recent window in circulation. Across Texas, K-12 public-school enrollment climbed by 11% during the 2019-20 school year. A companion brief will cover the more recent reporting window after the upstream source-system revision pass concludes.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 19. citfaith-t2-0475 (tier 2, unfaithful-tangential)

**Claim:**

> Within China, indexed peer-reviewed publications showed near double-digit gains in 2024, consistent with sector-wide patterns observed in materials-science venues.

**Citation:**

> Alvarez and Iversen, 2024, "A Decomposition of Indexed Peer-reviewed Publications Across Regions," Clarivate Web of Science Research Front Report.

**Source excerpt:**

> While related work covers China, this release focuses on the United States. Within that geography, indexed peer-reviewed publications delivered low-twenties percentage gains during 2024. Coverage of the corresponding China reading is set out in a companion release; the source files overlap, but the figure here is scoped only to US.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 20. citfaith-t3-0406 (tier 3, unfaithful-tangential)

**Claim:**

> Despite headwinds in adjacent sectors, annual robot installations in Germany registered a measurable contraction against the prior reading through 2024, particularly within the automotive sector.

**Citation:**

> Tannenbaum (2024). Quarterly Trends in Annual Robot Installations. International Federation of Robotics World Report.

**Source excerpt:**

> Following the desk's standard pass against the underlying source files, our headline reading is that annual robot installations produced a marked weakening from the comparable window during 2024. The figure carries the customary cautions about pending source revisions and rebasing windows, and the component covering the automotive sector is aligning with the broader reading within the typical revision range (the geography covered by this specific update is South Korea; a companion DE release is in preparation).

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 21. citfaith-t3-0001 (tier 3, unfaithful-contradictory)

**Claim:**

> Industry observers tracking grades K through 5 have noted that K-12 public-school enrollment across Texas delivered a discernible softening versus the antecedent quarter during the 2024-25 school year, though attribution remains debated.

**Citation:**

> Texas Education Agency Annual Statistical Report, "Forecasting K-12 Public-school Enrollment: Methods and Findings," Vasconcelos, May 2024.

**Source excerpt:**

> Following the standard revision pass and the desk's reconciliation memo, our reading is that K-12 public-school enrollment in Texas over the 2024-25 school year ultimately reflected a meaningful step up from the prior period. The component covering grades K through 5 moved with the aggregate, with no candidate seasonal-adjustment alternative that recovers the earlier direction.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 22. citfaith-t2-0224 (tier 2, unfaithful-contradictory)

**Claim:**

> Across adults aged 45 to 64 in Ohio, opioid prescriptions per capita posted a low-teens contraction during 2022, continuing a multi-quarter trend.

**Citation:**

> Whitfield et al., "Opioid Prescriptions Per Capita: 2022 Update," RAND Corporation Working Paper, 2022.

**Source excerpt:**

> Although there is meaningful within-period variation, the full 2022 reading for Ohio shows opioid prescriptions per capita producing low-teens percentage growth. The component covering adults aged 45 to 64 contributes the largest share of that movement, and no methodology revision we have tested reverses the sign reported here.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 23. citfaith-t3-0168 (tier 3, unfaithful-contradictory)

**Claim:**

> Despite headwinds in adjacent sectors, freight rail carload volume in the western US network registered a marked weakening from the comparable window through March 2026, particularly within container traffic.

**Citation:**

> Okafor (2026). Estimating Freight Rail Carload Volume Under Revised Methodology. Surface Transportation Board Quarterly Brief.

**Source excerpt:**

> Provisional cross-source reads supported the direction circulating in commentary, but after the multi-pass reconciliation against the source dataset completed, the headline for freight rail carload volume across the western US network during March 2026 resolves to a marked improvement relative to the comparable window. The sample restricted to container traffic is consistent with the resolved direction, with no decomposition we have tried that recovers the opposite direction.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 24. citfaith-t2-0199 (tier 2, unfaithful-contradictory)

**Claim:**

> Within the UK domestic market, apparel return rates showed high-single-digit softening in holiday season 2025, consistent with sector-wide patterns observed in womenswear.

**Citation:**

> Fitzgerald and Goncharov, 2025, "Forecasting Apparel Return Rates: Methods and Findings," Edge by Ascential Sector Report.

**Source excerpt:**

> Initial reads pointed toward the direction many commentators have cited; however, the revised release for the UK domestic market over holiday season 2025 shows that apparel return rates ultimately registered near double-digit gains, with womenswear tracking the aggregate within the normal cross-vintage variation band and no counter-contributing segment large enough to reverse the headline direction.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 25. citfaith-t3-0147 (tier 3, unfaithful-tangential)

**Claim:**

> Despite headwinds in adjacent sectors, battery-electric vehicle market share in Norway registered a clear deterioration from the trailing baseline through the first quarter of 2026, particularly within new passenger-car sales.

**Citation:**

> Devereux et al., "Forecasting Battery-electric Vehicle Market Share: Methods and Findings," BloombergNEF Electric Vehicle Outlook, 2026.

**Source excerpt:**

> Through the first quarter of 2026, the segment covering commercial light-duty sales within Norway produced a measurable contraction against the prior reading on the battery-electric vehicle market share series. The component covering new passenger-car sales is outside the scope of this release; it is queued for the next standalone release alongside the broader update. Readers tracking the broader segment should consult the parallel publication once it lands on schedule.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 26. citfaith-t2-0285 (tier 2, faithful)

**Claim:**

> Across womenswear in the UK domestic market, apparel return rates posted modest single-digit weakness during holiday season 2025, continuing a multi-quarter trend.

**Citation:**

> Statista Digital Market Insights, "Apparel Return Rates: 2025 Update," Vasconcelos, November 2025.

**Source excerpt:**

> Once the standard validation pass on the UK domestic market over holiday season 2025 cleared, the series indicates that apparel return rates delivered modest single-digit weakness, with the component covering womenswear carrying the share consistent with its basket weight. Outside of that segment, the pattern is less clear-cut, but the headline reading is stable across the usual sensitivity cuts.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 27. citfaith-t2-0492 (tier 2, unfaithful-contradictory)

**Claim:**

> Within the UK domestic market, apparel return rates showed a low-teens contraction in holiday season 2025, consistent with sector-wide patterns observed in womenswear.

**Citation:**

> Devereux (2025). Recent Movements in Apparel Return Rates. Retail Economics UK Industry Outlook.

**Source excerpt:**

> Initial proxy reads were directionally consistent with the published commentary; however, the revised release for the UK domestic market over holiday season 2025 shows that apparel return rates ultimately registered low-teens percentage growth, with womenswear aligning with the aggregate inside the customary measurement band and no offsetting component that would flip the resolved sign back.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 28. citfaith-t1-0339 (tier 1, faithful)

**Claim:**

> In holiday season 2025, apparel return rates in the UK domestic market softened by 31%.

**Citation:**

> Fitzgerald (2025). Recent Movements in Apparel Return Rates. Edge by Ascential Sector Report.

**Source excerpt:**

> Our updated dataset confirms that during holiday season 2025, apparel return rates in the UK domestic market fell by 31%, in line with the figure peer desks have circulated. Compilation methods are unchanged from the previous publication, and the headline number is comparable to prior releases on a like-for-like basis.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 29. citfaith-t1-0040 (tier 1, unfaithful-tangential)

**Claim:**

> Annual robot installations in Germany softened by 8% during 2024.

**Citation:**

> Nakashima (2023). A Decomposition of Annual Robot Installations Across Regions. Fraunhofer ISI Working Paper.

**Source excerpt:**

> The reading set out here is the 2023 figure, not the more recent window many writers have cited. Across Germany, annual robot installations dropped by 12.3% during 2023. A sibling publication will cover the more recent window after the underlying figures move out of preliminary status.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 30. citfaith-t2-0072 (tier 2, faithful)

**Claim:**

> Across materials-science venues in China, indexed peer-reviewed publications posted near double-digit gains during 2024, continuing a multi-quarter trend.

**Citation:**

> Helgesen et al., "Drivers of Indexed Peer-reviewed Publications Through the Cycle," Nature Index Annual Tables, 2024.

**Source excerpt:**

> Following our standard reconciliation pass on China across 2024, we observe that indexed peer-reviewed publications delivered low-twenties percentage gains, with the component covering materials-science venues contributing roughly the share one would expect from its weight in the underlying basket. Outside of that segment, the cross-section is patchier, but the headline reading is stable under the conventional sample-restriction tests.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 31. citfaith-t1-0445 (tier 1, unfaithful-contradictory)

**Claim:**

> Indexed peer-reviewed publications in China increased by 5.4% during 2024.

**Citation:**

> Goncharov and Vasconcelos, 2024, "Recent Movements in Indexed Peer-reviewed Publications," Elsevier Scopus Annual Bibliometric Review.

**Source excerpt:**

> Cutting against the commentary that has been circulating, our reading is that during 2024, indexed peer-reviewed publications in China moved in the opposite direction: the series declined by 8%. Magnitude-wise, the move is close to the figure circulated previously, but with the corrected reading carrying the opposite headline direction.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 32. citfaith-t2-0390 (tier 2, faithful)

**Claim:**

> Across materials-science venues in China, indexed peer-reviewed publications posted a low-teens contraction during 2024, continuing a multi-quarter trend.

**Citation:**

> Imamura et al., "Recent Movements in Indexed Peer-reviewed Publications," Nature Index Annual Tables, 2024.

**Source excerpt:**

> Once the standard validation pass on China over 2024 cleared, the latest reading finds that indexed peer-reviewed publications delivered high-single-digit softening, with the component covering materials-science venues moving in proportion to its weight in the aggregate basket. Outside of that segment, the picture across the remaining buckets is mixed, but the headline reading is consistent across the customary alternative-basis cuts.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 33. citfaith-t3-0122 (tier 3, unfaithful-tangential)

**Claim:**

> Despite headwinds in adjacent sectors, opioid prescriptions per capita in Ohio registered a meaningful step up from the prior period through 2022, particularly within adults aged 45 to 64.

**Citation:**

> Alvarez et al., "Sectoral Patterns of Opioid Prescriptions Per Capita," RAND Corporation Working Paper, 2022.

**Source excerpt:**

> Following the desk's multi-round pass on the underlying source files, our headline reading is that opioid prescriptions per capita produced a clear recovery from the trailing baseline during 2022. The figure carries the customary notes about source-system revisions and seasonal adjustment, and the component covering adults aged 45 to 64 is moving with the headline within the usual cross-source variation (the geography covered by this specific update is California; a companion Ohio release is in preparation).

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 34. citfaith-t2-0250 (tier 2, faithful)

**Claim:**

> Within Ohio, opioid prescriptions per capita showed low-teens percentage growth in 2022, consistent with sector-wide patterns observed in adults aged 45 to 64.

**Citation:**

> Health Affairs Research Brief, "Quarterly Trends in Opioid Prescriptions Per Capita," Whitfield, September 2022.

**Source excerpt:**

> After the standard methodology pass on Ohio through 2022, the publication notes that opioid prescriptions per capita delivered modest single-digit growth, with the component covering adults aged 45 to 64 contributing the share its compositional weight implies. Outside of that segment, the picture across the remaining buckets is mixed, but the headline reading is consistent with the figure under the standard weight overrides.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 35. citfaith-t1-0171 (tier 1, faithful)

**Claim:**

> In 2022, opioid prescriptions per capita in Ohio declined by 8%.

**Citation:**

> Hadjikyriacou (2022). Drivers of Opioid Prescriptions Per Capita Through the Cycle. JAMA Network Open Original Investigation.

**Source excerpt:**

> The headline finding is unchanged from our preliminary release: opioid prescriptions per capita in Ohio fell by 8% during 2022. Direction and magnitude both fall inside the band that parallel-source desks have been publishing for the comparable window.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 36. citfaith-t1-0332 (tier 1, unfaithful-tangential)

**Claim:**

> In April 2026, residential housing starts in the southern US fell by 11%.

**Citation:**

> Mortgage Bankers Association Research Note, "Cross-Country Dynamics of Residential Housing Starts," Imamura, July 2025.

**Source excerpt:**

> The figure highlighted in this brief covers April 2025, not the more recent window often cited in commentary. Across the southern US, residential housing starts fell by 9.7% during April 2025. A parallel companion update will cover the later window once the underlying inputs clear the routine revision window.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 37. citfaith-t1-0129 (tier 1, unfaithful-contradictory)

**Claim:**

> Battery-electric vehicle market share in Norway softened by 22% during the first quarter of 2026.

**Citation:**

> International Energy Agency Global EV Outlook, "Norway Battery-electric Vehicle Market Share: A Reassessment," Goncharov, May 2026.

**Source excerpt:**

> At odds with the prevailing narrative, our updated reading shows that the opposite headline holds. During the first quarter of 2026, battery-electric vehicle market share in Norway rose by 31%, with no decomposition we have tried that recovers the opposite direction.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 38. citfaith-t3-0254 (tier 3, unfaithful-tangential)

**Claim:**

> Despite headwinds in adjacent sectors, apparel return rates in the UK domestic market registered a measurable contraction against the prior reading through holiday season 2025, particularly within womenswear.

**Citation:**

> GlobalData Retail Quarterly, "Drivers of Apparel Return Rates Through the Cycle," Fitzgerald, March 2024.

**Source excerpt:**

> Drawing on the revised reference dataset, our coverage team reports that apparel return rates in the UK domestic market reflected a measurable contraction against the prior reading (window covered: holiday season 2024; a sibling vintage for the later window is queued for the next standard release). The component covering womenswear is aligning with the aggregate to within the usual sampling noise over the window analysed here, and the released figure is what the analytics desk lead validated in the pre-flight.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 39. citfaith-t1-0058 (tier 1, faithful)

**Claim:**

> In the second half of 2025, enterprise public-cloud spend in North America declined by 14%.

**Citation:**

> Whitfield et al., "A Decomposition of Enterprise Public-cloud Spend Across Regions," Gartner Cloud Adoption Outlook, 2025.

**Source excerpt:**

> The final figure carries through the preliminary reading without revision: enterprise public-cloud spend in North America fell by 14% during the second half of 2025. Comparable peer trackers report the same direction within the usual margin, and the magnitude is within historical norms for the series.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 40. citfaith-t3-0465 (tier 3, unfaithful-contradictory)

**Claim:**

> Despite headwinds in adjacent sectors, indexed peer-reviewed publications in China registered a marked improvement relative to the comparable window through 2024, particularly within materials-science venues.

**Citation:**

> Yamashita and Uchida, 2024, "Cross-Country Dynamics of Indexed Peer-reviewed Publications," Nature Index Annual Tables.

**Source excerpt:**

> Following the standard revision pass once the reconciliation cleared, our reading is that indexed peer-reviewed publications in China over 2024 ultimately reflected a clear deterioration from the trailing baseline. The component covering materials-science venues moved with the aggregate, and no methodology revision we have tested reverses the sign reported here.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 41. citfaith-t1-0389 (tier 1, unfaithful-contradictory)

**Claim:**

> In the first quarter of 2026, battery-electric vehicle market share in Norway rose by 5.4%.

**Citation:**

> Norsk Elbilforening Monthly Bulletin, "A Decomposition of Battery-electric Vehicle Market Share Across Regions," Vasconcelos, March 2026.

**Source excerpt:**

> Despite some of the framing in coverage, our reconciled reading is that during the first quarter of 2026, battery-electric vehicle market share in Norway moved in the opposite direction: the series softened by 5.4%. In size the move is close to the figure earlier coverage put forward, but with the resolved direction landing opposite the early commentary.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 42. citfaith-t1-0476 (tier 1, unfaithful-tangential)

**Claim:**

> Annual robot installations in Germany fell by 9.7% during 2024.

**Citation:**

> Nakashima (2023). Quarterly Trends in Annual Robot Installations. OECD Science, Technology and Innovation Outlook.

**Source excerpt:**

> This update covers the 2023 window and not the more recent period commentary has been citing. Across Germany, annual robot installations fell by 22% during 2023. A standalone follow-on note will address the later period after the upstream publisher finalises the comparable vintage.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 43. citfaith-t1-0039 (tier 1, faithful)

**Claim:**

> In 2022, opioid prescriptions per capita in Ohio increased by 8%.

**Citation:**

> CDC Morbidity and Mortality Weekly Report, "Forecasting Opioid Prescriptions Per Capita: Methods and Findings," Nakashima, March 2022.

**Source excerpt:**

> Our updated dataset confirms that during 2022, opioid prescriptions per capita in Ohio climbed by 8%, agreeing with the peer-source estimates within tolerance. Source-system scope, weighting, and compilation rules match the previous vintage, and the figure is comparable on an unrestated basis.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 44. citfaith-t3-0374 (tier 3, faithful)

**Claim:**

> Industry observers tracking financial-services buyers have noted that enterprise public-cloud spend across North America delivered a discernible softening versus the antecedent quarter during the second half of 2025, though attribution remains debated.

**Citation:**

> Yamashita (2025). Quarterly Trends in Enterprise Public-cloud Spend. Forrester Total Economic Impact Brief.

**Source excerpt:**

> Pulling from the consolidated reporting feed, our sector-coverage team estimates that enterprise public-cloud spend in North America produced a discernible softening versus the antecedent quarter over the second half of 2025. The estimate carries the customary caveats about provisional estimates and rebased baselines, but the core read for financial-services buyers is consistent with the dominant framing and agreeing with the read from the corresponding high-frequency panel that the research lead corroborated against peer estimates.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 45. citfaith-t2-0366 (tier 2, unfaithful-contradictory)

**Claim:**

> Across womenswear in the UK domestic market, apparel return rates posted low-twenties percentage gains during holiday season 2025, continuing a multi-quarter trend.

**Citation:**

> Salgado et al., "Forecasting Apparel Return Rates: Methods and Findings," Statista Digital Market Insights, 2025.

**Source excerpt:**

> Although there is meaningful within-period variation, the full holiday season 2025 reading for the UK domestic market shows apparel return rates producing high-single-digit softening. The component covering womenswear contributes the largest share of that movement, with no defensible methodology alternative that flips the sign back.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 46. citfaith-t1-0327 (tier 1, unfaithful-tangential)

**Claim:**

> In the second half of 2025, enterprise public-cloud spend in North America rose by 17%.

**Citation:**

> Fukushima and Goncharov, 2025, "NA Enterprise Public-cloud Spend: A Reassessment," 451 Research Voice of the Enterprise.

**Source excerpt:**

> Our update focuses on Asia-Pacific, where enterprise public-cloud spend rose by 17% during the second half of 2025. The NA figure falls outside the scope of this brief and is set aside for a separate update on the standard release timetable.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 47. citfaith-t1-0010 (tier 1, unfaithful-contradictory)

**Claim:**

> Indexed peer-reviewed publications in China fell by 22% during 2024.

**Citation:**

> OECD Science and Technology Indicators, "Indexed Peer-reviewed Publications: 2024 Update," Chowdhury, May 2024.

**Source excerpt:**

> Contrary to the directional read in earlier coverage, the data show that the opposite headline holds. During 2024, indexed peer-reviewed publications in China rose by 12.3%, and no methodology revision we have tested reverses the sign reported here.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-contradictory`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 48. citfaith-t2-0274 (tier 2, faithful)

**Claim:**

> Within China, indexed peer-reviewed publications showed double-digit decline in 2024, consistent with sector-wide patterns observed in materials-science venues.

**Citation:**

> Chowdhury and Ramaswamy, 2024, "A Decomposition of Indexed Peer-reviewed Publications Across Regions," Clarivate Web of Science Research Front Report.

**Source excerpt:**

> Once the published vintage for China over 2024 settled, the release reports that indexed peer-reviewed publications delivered an upper-single-digit fall, with the component covering materials-science venues contributing the proportion its underlying weight predicts. Outside of that segment, the residual segments move more idiosyncratically, but the headline reading is consistent across the conventional reweighting alternatives.

**Ground-truth label:** `faithful` (subcategory: `faithful`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 49. citfaith-t2-0141 (tier 2, unfaithful-tangential)

**Claim:**

> Within Norway, battery-electric vehicle market share showed near double-digit gains in the first quarter of 2026, consistent with sector-wide patterns observed in new passenger-car sales.

**Citation:**

> European Environment Agency Indicator Report, "Estimating Battery-electric Vehicle Market Share Under Revised Methodology," Quintero, March 2026.

**Source excerpt:**

> While related work covers Norway, this release focuses on the United Kingdom. Within that geography, battery-electric vehicle market share delivered high-single-digit improvement during the first quarter of 2026. Coverage of the Norway reading is documented in a parallel release; the source data have considerable overlap, but the figure here covers only UK.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 50. citfaith-t2-0360 (tier 2, unfaithful-tangential)

**Claim:**

> Across container traffic in the western US network, freight rail carload volume posted an upper-single-digit fall during March 2026, continuing a multi-quarter trend.

**Citation:**

> Salgado and Ramaswamy, 2026, "Sectoral Patterns of Freight Rail Carload Volume," Bureau of Transportation Statistics Freight Facts.

**Source excerpt:**

> Restricting the sample to bulk commodity traffic in the western US network, our update shows that freight rail carload volume delivered an upper-single-digit fall during March 2026. The component covering container traffic appears in a separate sibling note and is not the basis of the headline number reported here; readers focused on it should refer to the companion publication.

**Ground-truth label:** `unfaithful` (subcategory: `unfaithful-tangential`)

Verdict: [ ] pass / [ ] fail
Notes: 

---
