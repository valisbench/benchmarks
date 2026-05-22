# Spot-Check Verdicts -- GPT-5.5

Dataset: citation_faithfulness v1.0.0 (rev2)
Dataset SHA: 9982d7e97ed4535695cf4e0517bb9c64bffce6f30fe09a461867ac796c8d6584
Reviewer: GPT-5.5 (via codex CLI)

## citfaith-t3-0123
Verdict: pass
Reasoning: The excerpt supports the claim’s core metric, region, period, subgroup comparison, and downward direction, and both the citation and publication-style excerpt are plausible.

## citfaith-t3-0081
Verdict: pass
Reasoning: The excerpt supports a similar cloud-spend weakening for financial-services buyers in the same period but explicitly covers Asia-Pacific rather than North America, so the ground-truth unfaithful-tangential label is correct.

## citfaith-t2-0459
Verdict: pass
Reasoning: The excerpt directly contradicts the claim by reporting a mid-teens decline in Texas K-12 public-school enrollment for 2024-25 rather than low-teens growth, while the citation and excerpt are plausible.

## citfaith-t1-0192
Verdict: pass
Reasoning: The excerpt directly supports the claim with the same period, region, metric, and 22% increase, and both the citation and excerpt read plausibly.

## citfaith-t1-0370
Verdict: pass
Reasoning: The excerpt discusses Midwest starts rising 18.6% and explicitly says the South figure is outside the release, so it does not support the claim about 31% growth in the southern US.

## citfaith-t3-0451
Verdict: pass
Reasoning: The excerpt directly contradicts the claim by saying Norway's battery-electric vehicle market share contracted in Q1 2026 and that new passenger-car sales moved the same way, so the unfaithful-contradictory label is correct.

## citfaith-t1-0104
Verdict: pass
Reasoning: The excerpt directly supports the claim with the same metric, region, period, direction, and 5.4% magnitude, and the citation and source text read as plausible publication material.

## citfaith-t1-0105
Verdict: pass
Reasoning: The unfaithful label is correct because the excerpt directly contradicts the claim, stating that March 2026 western US freight rail carload volume declined by 22% rather than grew by 11%.

## citfaith-t2-0316
Verdict: pass
Reasoning: The source excerpt directly contradicts the claim by describing a low-teens contraction in North American enterprise public-cloud spend rather than near double-digit gains, while the citation and excerpt are plausible.

## citfaith-t3-0110
Verdict: pass
Reasoning: The claim asserts firming while the excerpt states softening for the same metric, region, period, and subgroup, making the plausible citation and source correctly labeled unfaithful-contradictory.

## citfaith-t3-0151
Verdict: fail
Reasoning: The excerpt supports a BEV market-share softening in Norway during Q1 2026, but it does not support the claim's attribution caveat and weakens the magnitude from "marked weakening" to "discernible softening."

## citfaith-t3-0402
Verdict: pass
Reasoning: The excerpt plausibly supports the cited claim by matching the BEV market-share metric, Norway, first-quarter 2026 period, new passenger-car sales subgroup, and weakening direction.

## citfaith-t2-0340
Verdict: pass
Reasoning: The excerpt is scoped to South Korea and explicitly excludes the Germany reading, so it does not support the Germany-specific claim, matching the unfaithful-tangential label.

## citfaith-t2-0495
Verdict: fail
Reasoning: The source reports a low-teens contraction, while the claim says high-single-digit softening, so the magnitude does not line up with the ground-truth faithful label.

## citfaith-t1-0347
Verdict: pass
Reasoning: The ground-truth label matches because the excerpt directly contradicts the claim, saying Ohio opioid prescriptions per capita fell 22% in 2022 rather than climbed 14%, while the citation and excerpt read plausibly.

## citfaith-t3-0386
Verdict: fail
Reasoning: The excerpt supports China publications improving in 2024 and materials-science alignment, but its awkward generated phrasing does not read like plausible publication text.

## citfaith-t2-0421
Verdict: pass
Reasoning: The excerpt explicitly scopes the BEV market-share decline to the United Kingdom while the claim is about Norway, so the ground-truth unfaithful-tangential label is correct and the citation/excerpt are plausible.

## citfaith-t1-0178
Verdict: pass
Reasoning: The source discusses Texas K-12 public-school enrollment but for 2019-20 at 11%, not the claimed 2024-25 increase of 14%, so the unfaithful-tangential label is correct and the citation/excerpt are plausible.

## citfaith-t2-0475
Verdict: pass
Reasoning: The ground-truth unfaithful label is correct because the claim concerns China and materials-science sector patterns, while the excerpt explicitly scopes the reported 2024 publication gains to the United States and says China is covered elsewhere.

## citfaith-t3-0406
Verdict: pass
Reasoning: The source excerpt discusses annual robot-installation weakening and automotive alignment for South Korea, not Germany, so the ground-truth unfaithful-tangential label is correct and the citation/excerpt are plausible.

## citfaith-t3-0001
Verdict: pass
Reasoning: The source excerpt contradicts the claim by saying Texas K-12 enrollment, including grades K through 5, stepped up from the prior period rather than softened, and the citation and excerpt are plausible.

## citfaith-t2-0224
Verdict: pass
Reasoning: The source explicitly reports low-teens growth for the same Ohio adults 45 to 64 opioid-prescription metric in 2022, contradicting the claim’s low-teens contraction, so the unfaithful-contradictory label is correct.

## citfaith-t3-0168
Verdict: pass
Reasoning: The excerpt directly contradicts the claim by reporting a marked improvement, including for container traffic, so the unfaithful-contradictory label is correct and the citation/source look plausible.

## citfaith-t2-0199
Verdict: pass
Reasoning: The source directly contradicts the claim by reporting near double-digit gains in UK apparel return rates during holiday season 2025 rather than high-single-digit softening, while the citation and excerpt are plausible.

## citfaith-t3-0147
Verdict: pass
Reasoning: The excerpt discusses Norway commercial light-duty sales and explicitly excludes new passenger-car sales, so it does not support the claim about passenger-car market share deterioration while remaining plausible publication text with a plausible citation.

## citfaith-t2-0285
Verdict: fail
Reasoning: The excerpt supports modest single-digit weakness for UK apparel return rates in holiday season 2025, but it does not substantiate a womenswear-specific result or the claimed continuing multi-quarter trend.

## citfaith-t2-0492
Verdict: pass
Reasoning: The ground-truth unfaithful label is correct because the claim says low-teens contraction while the excerpt states low-teens percentage growth for the same UK domestic holiday 2025 apparel/womenswear scope, and the citation/excerpt are plausible.

## citfaith-t1-0339
Verdict: pass
Reasoning: The claim matches the excerpt on period, metric, UK domestic market scope, direction, and 31% magnitude, and both the citation and excerpt read as plausible publication text.

## citfaith-t1-0040
Verdict: pass
Reasoning: The excerpt discusses Germany robot installations but for 2023 with a 12.3% drop, not the claimed 2024 8% softening, so the unfaithful-tangential label is correct and the citation/excerpt are plausible.

## citfaith-t2-0072
Verdict: fail
Reasoning: The excerpt reports low-twenties overall gains for China in 2024 and only says materials-science contributed its expected share, without supporting near double-digit gains within materials-science venues or a continuing multi-quarter trend.

## citfaith-t1-0445
Verdict: pass
Reasoning: The source excerpt directly contradicts the claim by saying China’s indexed peer-reviewed publications declined by 8% in 2024 rather than increased by 5.4%, and the excerpt and citation appear plausible.

## citfaith-t2-0390
Verdict: fail
Reasoning: The excerpt only supports high-single-digit softening for China in 2024 and says the materials-science component moved proportionally, but it does not support a low-teens contraction or a continuing multi-quarter trend.

## citfaith-t3-0122
Verdict: pass
Reasoning: The excerpt discusses the same metric, period, and subgroup but explicitly says the covered geography is California rather than Ohio, so the Ohio claim is tangentially unsupported while the citation and excerpt are plausible.

## citfaith-t2-0250
Verdict: fail
Reasoning: The excerpt says Ohio opioid prescriptions per capita had modest single-digit growth, which does not support the claim of low-teens percentage growth.

## citfaith-t1-0171
Verdict: fail
Reasoning: Although the excerpt directly supports the claim, the cited Hadjikyriacou 2022 JAMA Network Open article does not appear to be a real-world reference.

## citfaith-t1-0332
Verdict: pass
Reasoning: The ground-truth unfaithful label is correct because the excerpt discusses April 2025 and a 9.7% decline, while the claim asserts April 2026 and an 11% decline, with a plausible citation and publication-style excerpt.

## citfaith-t1-0129
Verdict: pass
Reasoning: The source excerpt directly contradicts the claim by saying Norway BEV market share rose 31% in Q1 2026 rather than softened by 22%, and the citation and excerpt are plausible enough for the ground-truth unfaithful label.

## citfaith-t3-0254
Verdict: pass
Reasoning: The ground-truth unfaithful label is correct because the excerpt covers holiday season 2024 and says the later window is not yet released, while the claim asserts holiday season 2025 and emphasizes womenswear beyond what the source supports.

## citfaith-t1-0058
Verdict: pass
Reasoning: The excerpt exactly supports the claim’s metric, region, period, direction, and magnitude, and both the citation and publication-style excerpt are plausible.

## citfaith-t3-0465
Verdict: pass
Reasoning: The source directly contradicts the claim by reporting deterioration rather than marked improvement for China in 2024, including materials-science venues, while the citation and excerpt are plausible.

## citfaith-t1-0389
Verdict: pass
Reasoning: The source excerpt directly contradicts the claim by saying Norway's battery-electric vehicle market share softened by 5.4% in Q1 2026 rather than rose, while the excerpt and citation are plausible.

## citfaith-t1-0476
Verdict: pass
Reasoning: The excerpt concerns Germany robot installations but covers 2023 with a 22% fall while explicitly excluding the later 2024 period, so it is tangential to and does not support the claim.

## citfaith-t1-0039
Verdict: pass
Reasoning: The excerpt directly supports the claim with the same metric, location, period, and 8% increase, and the citation and publication-style text are plausible.

## citfaith-t3-0374
Verdict: fail
Reasoning: The excerpt supports the claim, but it reads like synthetic, awkwardly stitched text rather than plausible publication prose.

## citfaith-t2-0366
Verdict: pass
Reasoning: The unfaithful label is correct because the claim reports low-twenties percentage gains while the excerpt states high-single-digit softening and explicitly says the sign cannot be flipped back, with a plausible citation and excerpt.

## citfaith-t1-0327
Verdict: pass
Reasoning: The excerpt supports a 17% rise only for Asia-Pacific and explicitly excludes North America, so the unfaithful-tangential label is correct and the citation/excerpt look plausible.

## citfaith-t1-0010
Verdict: pass
Reasoning: The excerpt directly contradicts the claim by saying China’s indexed peer-reviewed publications rose 12.3% in 2024 rather than fell 22%, so the unfaithful-contradictory label is correct and the citation/excerpt are plausible.

## citfaith-t2-0274
Verdict: fail
Reasoning: The excerpt reports an upper-single-digit fall for China in 2024, which does not support the claim of a double-digit decline.

## citfaith-t2-0141
Verdict: pass
Reasoning: The source excerpt explicitly limits the reported first-quarter 2026 battery-electric market-share improvement to the UK rather than Norway, so the Norway claim is tangentially unsupported while the excerpt and citation are plausible.

## citfaith-t2-0360
Verdict: pass
Reasoning: The source excerpt concerns bulk commodity traffic rather than container traffic while explicitly directing container-focused readers elsewhere, so the ground-truth unfaithful-tangential label matches and the citation/excerpt are plausible.

## citfaith-t3-0254
Verdict: pass
Reasoning: The ground-truth unfaithful label is correct because the source covers holiday season 2024 and says womenswear only aligns with the aggregate, while the claim asserts a holiday season 2025 contraction particularly within womenswear.

## citfaith-t1-0058
Verdict: pass
Reasoning: The excerpt directly supports the same metric, region, period, direction, and magnitude as the claim, and the citation appears plausible.

## citfaith-t3-0465
Verdict: pass
Reasoning: The source excerpt directly contradicts the claim by saying China’s indexed peer-reviewed publications deteriorated in 2024 and that materials-science venues moved with that decline, while the citation and excerpt are plausible enough.

## citfaith-t1-0389
Verdict: pass
Reasoning: The source excerpt directly contradicts the claim by saying Norway's battery-electric vehicle market share softened by 5.4% in Q1 2026 rather than rose, and the citation and excerpt are plausible.

## citfaith-t1-0476
Verdict: pass
Reasoning: The excerpt concerns Germany annual robot installations but explicitly covers 2023 with a 22% decline, not the claim's 2024 period or 9.7% magnitude, so the unfaithful-tangential label is correct and the text/citation are plausible.

## citfaith-t1-0039
Verdict: fail
Reasoning: Although the excerpt directly supports the claim, the March 2022 citation cannot plausibly confirm a full-year 2022 increase and the citation/excerpt read like synthetic publication text.

## citfaith-t3-0374
Verdict: pass
Reasoning: The excerpt directly supports the claim on metric, region, period, direction, and buyer context, and the citation and publication-style excerpt are plausible.

## citfaith-t2-0366
Verdict: pass
Reasoning: The excerpt contradicts the claim by reporting high-single-digit softening rather than low-twenties percentage gains, so the unfaithful-contradictory label is correct.

## citfaith-t1-0327
Verdict: pass
Reasoning: The excerpt supports 17% growth only for Asia-Pacific and explicitly excludes North America, so the ground-truth unfaithful-tangential label is correct and the citation/excerpt are plausible.

## citfaith-t1-0010
Verdict: pass
Reasoning: The source explicitly contradicts the claim by reporting a 12.3% rise in China during 2024 rather than a 22% fall, so the unfaithful-contradictory label is correct.

## citfaith-t2-0274
Verdict: fail
Reasoning: The source excerpt reports an upper-single-digit fall rather than the claim's double-digit decline, so the ground-truth faithful label does not match the evidence.

## citfaith-t2-0141
Verdict: pass
Reasoning: The excerpt discusses UK battery-electric vehicle market share and explicitly says Norway is covered elsewhere, so the Norway claim is tangentially unsupported and the unfaithful label is correct.

## citfaith-t2-0360
Verdict: pass
Reasoning: The ground-truth unfaithful-tangential label matches because the claim concerns container traffic while the excerpt explicitly reports bulk commodity traffic and excludes container traffic, with a plausible citation and source excerpt.
