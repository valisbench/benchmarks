# Cross-Reviewer Disagreement Analysis -- v1.0.0
Date: 2026-05-22
Reviewers: Claude Opus 4.7, GPT-5.5 (via codex CLI), Gemini 3.1 Pro
Cases per wedge: 50 (200 cases total across 4 new wedges)

## Per-wedge agreement summary

| Wedge | 3/3 pass | 2/3 pass | 1/3 pass | 0/3 pass | total |
|---|---|---|---|---|---|
| falsifier_observability | 30 | 4 | 16 | 0 | 50 |
| citation_faithfulness | 37 | 5 | 8 | 0 | 50 |
| boundary_condition_omission | 29 | 12 | 9 | 0 | 50 |
| load_bearing_claim_identification | 42 | 4 | 4 | 0 | 50 |

Notes on incompletes:

## Per-wedge detail

### falsifier_observability

#### 2-of-3 FAIL (16)
Two reviewers failed; one passed. These are methodology-divergence cases; surface for sponsor adjudication.

**falsobs-t1-0006**

> > Our go-to-market strategy will succeed if first-half topline clears $45M by end of Q4.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Concrete metric (first-half topline), explicit threshold ($45M), and a specific deadline (end of Q4) make the failure mode directly observable.
- **gpt55** (fail): The numeric threshold and date are attached to the vague predicate “strategy will succeed,” and the conditional wording does not make missing $45M a concrete falsifier of the claim.
- **gemini31pro** (fail): The claim is a conditional statement where the consequent ('strategy will succeed') is vague and unmeasurable, making the entire statement unfalsifiable even if the specific condition is met.

**falsobs-t1-0236**

> > Our channel partner program will succeed if Q4 revenue tops $22M before the next planning cycle.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Q4 revenue > $22M before next planning cycle is a measurable metric/threshold/deadline; correctly observable_falsifier.
- **gpt55** (fail): The metric and threshold are concrete, but the time bound 'before the next planning cycle' is not stated concretely enough to make the claim observable within ~90 days from the sentence alone.
- **gemini31pro** (fail): The claim binds a specific metric and time bound to a vague predicate ('will succeed') in a conditional framing, making it unfalsifiable.

**falsobs-t2-0134**

> > We are on track, absent a major adverse event, if second-half bookings lands above $8M by the end of fiscal Q3.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Second-half bookings > $8M by end of fiscal Q3 is concrete; "absent a major adverse event" is hedging but does not vacate the predicate.
- **gpt55** (fail): The numeric bookings threshold and fiscal-Q3 date are embedded in a conditional/vague 'on track, absent a major adverse event' framing, so the claim is not concretely falsifiable as written.
- **gemini31pro** (fail): The phrase 'absent a major adverse event' is a macro-conditional framing that makes the claim unfalsifiable, so the correct label is stated_unfalsifiable.

**falsobs-t2-0204**

> > The team's working assumption, barring a Q3 slowdown, is that trailing-twelve-month gross revenue tops $250M before the next earnings call.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): TTM gross revenue > $250M before earnings call is fully measurable; the "barring Q3 slowdown" hedge does not vacate the metric per rubric, since the predicate remains concrete.
- **gpt55** (fail): Although it includes a revenue threshold and time bound, the 'barring a Q3 slowdown' qualifier makes the claim conditionally self-excusing rather than concretely falsifiable as written.
- **gemini31pro** (fail): The sentence includes a macro-conditional framing ('barring a Q3 slowdown') that provides an escape hatch, making the claim stated_unfalsifiable rather than an observable_falsifier.

**falsobs-t2-0228**

> > The team's working assumption, barring a Q3 slowdown, is that first-half topline lands above $8M by December 31.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): First-half topline > $8M by December 31 is a concrete dollar threshold with a hard date; correctly observable_falsifier.
- **gpt55** (fail): Although it includes a metric, threshold, and date, the vague escape clause “barring a Q3 slowdown” makes the claim conditionally framed and not cleanly falsifiable as written.
- **gemini31pro** (fail): The claim includes a macro-conditional framing ('barring a Q3 slowdown') that makes it unfalsifiable, so it should be labeled stated_unfalsifiable.

**falsobs-t2-0239**

> > Barring a Q3 slowdown, our enterprise expansion succeeds if Q3 total bookings clears $45M before the next earnings call.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Q3 total bookings > $45M before next earnings call is a measurable, time-bound claim; hedge is structural surface form, not a vacating condition.
- **gpt55** (fail): The vague carveout “Barring a Q3 slowdown” makes the failure condition self-excusing even though the bookings threshold and timing are otherwise observable.
- **gemini31pro** (fail): The sentence includes a macro-conditional framing ('Barring a Q3 slowdown') that acts as an escape hatch, making the claim stated_unfalsifiable rather than an observable_falsifier.

**falsobs-t2-0274**

> > Assuming the team executes, the working number is that qualified pipeline deals crosses 240 by end of Q4.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Qualified pipeline deals > 240 by end of Q4 is countable and time-bound; "assuming the team executes" is structural hedge that doesn't vacate the metric.
- **gpt55** (fail): The vague condition “Assuming the team executes” makes the claim self-sealing, since missing 240 by end of Q4 could be dismissed as non-execution rather than falsifying the sentence.
- **gemini31pro** (fail): The claim includes a macro-conditional framing ('Assuming the team executes') that makes it unfalsifiable, so the correct label should be stated_unfalsifiable.

**falsobs-t2-0379**

> > Assuming the team executes, the working number is that live integration count exceeds 950 before the next earnings call.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Live integration count > 950 before next earnings call is countable and time-bound; "assuming the team executes" is hedging but the predicate stays observable.
- **gpt55** (fail): The vague condition "Assuming the team executes" makes the threshold contingent on an undefined self-sealing predicate, so the claim is not falsifiable as written.
- **gemini31pro** (fail): The phrase 'Assuming the team executes' is a macro-conditional framing that makes the claim unfalsifiable, so the ground-truth label of observable_falsifier is incorrect.

**falsobs-t2-0467**

> > Our pricing strategy should work, barring a Q3 slowdown, if active enterprise accounts crosses 240 by the end of the half.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Active enterprise accounts > 240 by end of the half is countable and time-bound; correctly observable_falsifier.
- **gpt55** (fail): Although it includes a numeric account threshold and time reference, the vague predicate "should work" plus conditional carveouts like "barring a Q3 slowdown" do not define a concretely observable falsifier.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('barring a Q3 slowdown') and vague predicates ('should work'), making it unfalsifiable rather than an observable falsifier.

**falsobs-t3-0048**

> > The pre-registered success criterion, provided that the macro doesn't shift materially and conditional on the channel partner ramp continuing on its current curve, is that Q3 total bookings exceeds $14M by close of Q2.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Q3 total bookings > $14M by close of Q2 is a specific metric, threshold, and date; correctly observable_falsifier despite T3 hedges.
- **gpt55** (fail): Although it includes a metric and deadline, the claim is insulated by vague macro and partner-ramp conditions, making it stated_unfalsifiable as written.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('provided that the macro doesn't shift materially and conditional on the channel partner ramp continuing on its current curve') which make it unfalsifiable, so the correct label is stated_unfalsifiable.

**falsobs-t3-0183**

> > The new platform launch succeeds when, provided that the macro doesn't shift materially and conditional on the channel partner ramp continuing on its current curve, verified customer logos passes 5,200 by December 31.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Verified customer logos > 5,200 by December 31 is directly observable; the hedge clauses don't undermine the concrete count and date.
- **gpt55** (fail): Although it includes a metric and date, the claim is insulated by vague macro and partner-ramp conditions, making it stated_unfalsifiable as written.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('provided that the macro doesn't shift materially'), which makes it stated_unfalsifiable according to the rubric.

**falsobs-t3-0233**

> > The pre-registered success criterion, provided that the macro doesn't shift materially and conditional on the channel partner ramp continuing on its current curve, is that second-half bookings clears $45M before the next planning cycle.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Despite heavy T3 hedging, second-half bookings clearing $45M before the next planning cycle remains a concrete metric/threshold/time-bound triple, properly observable_falsifier.
- **gpt55** (fail): The claim is insulated by vague macro and channel-ramp conditions and an imprecise planning-cycle time bound, so its failure mode is not concretely observable as written.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('provided that the macro doesn't shift materially'), which makes it stated_unfalsifiable according to the rubric.

**falsobs-t3-0270**

> > Provided that the macro doesn't shift materially and conditional on the channel partner ramp continuing on its current curve, the working test is that next-quarter committed ARR lands above $8M by December 31.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Next-quarter committed ARR > $8M by December 31 is a specific dollar threshold with a hard date; T3 hedges don't dilute the testable predicate.
- **gpt55** (fail): The ARR threshold and date are concrete, but the vague macro and channel-ramp conditions make the claim self-insulating as written, so it should be labeled stated_unfalsifiable.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('Provided that the macro doesn't shift materially'), which makes it stated_unfalsifiable according to the rubric.

**falsobs-t3-0319**

> > Our acquisition strategy succeeds when, provided the cohort metrics carry through Q4 and absent the realized-loss scenario the risk team has flagged at 15-20%, verified customer logos tops 1,200 before the next earnings call.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Verified customer logos > 1,200 before next earnings call is concrete count and deadline; T3 hedges don't vacate it.
- **gpt55** (fail): The numeric logo threshold is tied to vague conditional escape clauses about cohort metrics and a realized-loss scenario, so the claim is not concretely falsifiable as written.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('provided the cohort metrics carry through Q4' and 'absent the realized-loss scenario') that make it unfalsifiable, so it should be labeled stated_unfalsifiable.

**falsobs-t3-0354**

> > Provided the cohort metrics carry through Q4 and absent the realized-loss scenario the risk team has flagged at 15-20%, the working test is that Q4 revenue exceeds $120M by the end of the half.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Q4 revenue > $120M by end of the half is a measurable metric, threshold, and time bound; T3 hedges don't dissolve the predicate.
- **gpt55** (fail): The claim is conditional on vague, under-specified predicates about cohort metrics carrying through and an absent realized-loss scenario, so the stated failure mode is not concretely observable as written.
- **gemini31pro** (fail): The sentence contains macro-conditional framings ('Provided the cohort metrics carry through Q4 and absent the realized-loss scenario') that make it unfalsifiable, so the ground-truth label of observable_falsifier is incorrect.

**falsobs-t3-0458**

> > The team's committed milestone is that provided the cohort metrics carry through Q4 and absent the realized-loss scenario the risk team has flagged at 15-20%, active enterprise accounts passes 18,000 by the end of fiscal Q3.
> 
> **Ground-truth label:** `observable_falsifier`
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): Active enterprise accounts > 18,000 by end of fiscal Q3 is concrete and countable; T3 hedges do not vacate the predicate.
- **gpt55** (fail): The claim is conditionally shielded by vague predicates about cohort metrics carrying through Q4 and an absent realized-loss scenario, so the 18,000-account threshold is not concretely falsifiable as written.
- **gemini31pro** (fail): The claim contains macro-conditional framings ('provided the cohort metrics carry through Q4' and 'absent the realized-loss scenario') that make it unfalsifiable, so it should be labeled stated_unfalsifiable.


#### 2-of-3 PASS (4)
Two reviewers passed; one failed. These are minor disagreements; majority verdict accepts.

- falsobs-t1-0200 -- gemini31pro dissented: The sentence uses a macro-conditional framing and a vague predicate ('will succeed'), making it unfalsifiable, so the ground-truth label of observable_falsifier is incorrect.
- falsobs-t1-0280 -- gemini31pro dissented: The sentence uses a conditional framing where the specific metric is the condition, leaving the actual claim ('strategy works') vague and logically unfalsifiable regardless of whether the metric is met.
- falsobs-t1-0389 -- gemini31pro dissented: The claim uses a conditional framing ('if') and binds a specific metric to a vague, subjective predicate ('works'), making it unfalsifiable rather than an observable falsifier.
- falsobs-t3-0452 -- gemini31pro dissented: The sentence includes macro-conditional framings ('assuming the renewal cohort lands in line with the modeled mid-case') which makes it stated_unfalsifiable, contradicting the ground-truth label.


#### Unanimous PASS (30)
Auto-accepted; no detail needed.

### citation_faithfulness

#### 2-of-3 FAIL (8)
Two reviewers failed; one passed. These are methodology-divergence cases; surface for sponsor adjudication.

**citfaith-t1-0171**

> **Claim:**
> 
> > In 2022, opioid prescriptions per capita in Ohio declined by 8%.
> 
> **Citation:**
> 
> > Hadjikyriacou (2022). Drivers of Opioid Prescriptions Per Capita Through the Cycle. JAMA Network Open Original Investigation.
> 
> **Source excerpt:**
> 
> > The headline finding is unchanged from our preliminary release: opioid prescriptions per capita in Ohio fell by 8% during 2022. Direction and magnitude both fall inside the band that parallel-source desks have been publishing for the comparable window.
> ...

- **opus47** (pass): Identical metric, region, period; both report 8% decline/fall on opioid prescriptions / Ohio / 2022; direction and magnitude match precisely; faithful holds.
- **gpt55** (fail): Although the excerpt directly supports the claim, the cited Hadjikyriacou 2022 JAMA Network Open article does not appear to be a real-world reference.
- **gemini31pro** (fail): The source excerpt contains the phrase 'parallel-source desks', which sounds like newsroom or financial jargon and is highly implausible for a JAMA Network Open medical research article.

**citfaith-t2-0072**

> **Claim:**
> 
> > Across materials-science venues in China, indexed peer-reviewed publications posted near double-digit gains during 2024, continuing a multi-quarter trend.
> 
> **Citation:**
> 
> > Helgesen et al., "Drivers of Indexed Peer-reviewed Publications Through the Cycle," Nature Index Annual Tables, 2024.
> 
> **Source excerpt:**
> 
> > Following our standard reconciliation pass on China across 2024, we observe that indexed peer-reviewed publications delivered low-twenties percentage gains, with the compo...

- **opus47** (pass): Claim asserts near double-digit gains and source asserts low-twenties percentage gains on indexed peer-reviewed publications / China / 2024 / materials-science venues; both are gains in same direction with magnitudes in adjacent bands; faithful per the dataset's tolerance.
- **gpt55** (fail): The excerpt reports low-twenties overall gains for China in 2024 and only says materials-science contributed its expected share, without supporting near double-digit gains within materials-science venues or a continuing multi-quarter trend.
- **gemini31pro** (fail): The source excerpt describes 'low-twenties percentage gains' rather than 'near double-digit gains' and contains no mention of a 'multi-quarter trend,' meaning the claim is unfaithful and contradicts the ground-truth label.

**citfaith-t2-0250**

> **Claim:**
> 
> > Within Ohio, opioid prescriptions per capita showed low-teens percentage growth in 2022, consistent with sector-wide patterns observed in adults aged 45 to 64.
> 
> **Citation:**
> 
> > Health Affairs Research Brief, "Quarterly Trends in Opioid Prescriptions Per Capita," Whitfield, September 2022.
> 
> **Source excerpt:**
> 
> > After the standard methodology pass on Ohio through 2022, the publication notes that opioid prescriptions per capita delivered modest single-digit growth, with the compone...

- **opus47** (pass): Claim asserts low-teens percentage growth and source asserts modest single-digit growth on opioid prescriptions / Ohio / 2022 / adults 45-64; both growth in adjacent magnitude bands; faithful holds.
- **gpt55** (fail): The excerpt says Ohio opioid prescriptions per capita had modest single-digit growth, which does not support the claim of low-teens percentage growth.
- **gemini31pro** (fail): The claim states low-teens percentage growth, but the source excerpt reports modest single-digit growth, making the ground-truth label of faithful incorrect.

**citfaith-t2-0274**

> **Claim:**
> 
> > Within China, indexed peer-reviewed publications showed double-digit decline in 2024, consistent with sector-wide patterns observed in materials-science venues.
> 
> **Citation:**
> 
> > Chowdhury and Ramaswamy, 2024, "A Decomposition of Indexed Peer-reviewed Publications Across Regions," Clarivate Web of Science Research Front Report.
> 
> **Source excerpt:**
> 
> > Once the published vintage for China over 2024 settled, the release reports that indexed peer-reviewed publications delivered an upp...

- **opus47** (pass): Claim asserts double-digit decline and source asserts upper-single-digit fall on indexed peer-reviewed publications / China / 2024 / materials-science venues; both declines in adjacent magnitude bands; faithful holds.
- **gpt55** (fail): The source excerpt reports an upper-single-digit fall rather than the claim's double-digit decline, so the ground-truth faithful label does not match the evidence.
- **gemini31pro** (fail): The claim states a double-digit decline, but the source excerpt reports an upper-single-digit fall, making the claim unfaithful and contradicting the ground-truth label.

**citfaith-t2-0285**

> **Claim:**
> 
> > Across womenswear in the UK domestic market, apparel return rates posted modest single-digit weakness during holiday season 2025, continuing a multi-quarter trend.
> 
> **Citation:**
> 
> > Statista Digital Market Insights, "Apparel Return Rates: 2025 Update," Vasconcelos, November 2025.
> 
> **Source excerpt:**
> 
> > Once the standard validation pass on the UK domestic market over holiday season 2025 cleared, the series indicates that apparel return rates delivered modest single-digit weakness, ...

- **opus47** (pass): Both claim and source report modest single-digit weakness on apparel return rates / UK / holiday 2025 / womenswear; direction and magnitude band match exactly; faithful holds.
- **gpt55** (fail): The excerpt supports modest single-digit weakness for UK apparel return rates in holiday season 2025, but it does not substantiate a womenswear-specific result or the claimed continuing multi-quarter trend.
- **gemini31pro** (fail): The claim includes the phrase 'continuing a multi-quarter trend,' which is entirely absent from the source excerpt, making the ground-truth label of faithful incorrect.

**citfaith-t2-0390**

> **Claim:**
> 
> > Across materials-science venues in China, indexed peer-reviewed publications posted a low-teens contraction during 2024, continuing a multi-quarter trend.
> 
> **Citation:**
> 
> > Imamura et al., "Recent Movements in Indexed Peer-reviewed Publications," Nature Index Annual Tables, 2024.
> 
> **Source excerpt:**
> 
> > Once the standard validation pass on China over 2024 cleared, the latest reading finds that indexed peer-reviewed publications delivered high-single-digit softening, with the compon...

- **opus47** (pass): Claim asserts low-teens contraction and source asserts high-single-digit softening on indexed peer-reviewed publications / China / 2024 / materials-science venues; both declines in adjacent magnitude bands; faithful holds.
- **gpt55** (fail): The excerpt only supports high-single-digit softening for China in 2024 and says the materials-science component moved proportionally, but it does not support a low-teens contraction or a continuing multi-quarter trend.
- **gemini31pro** (fail): The claim states a 'low-teens contraction' for materials-science venues, but the source excerpt indicates a 'high-single-digit softening' for the aggregate and that materials-science moved in proportion, contradicting the claim and making the 'faithful' label incorrect.

**citfaith-t2-0495**

> **Claim:**
> 
> > Within the UK domestic market, apparel return rates showed high-single-digit softening in holiday season 2025, consistent with sector-wide patterns observed in womenswear.
> 
> **Citation:**
> 
> > Iversen (2025). Forecasting Apparel Return Rates: Methods and Findings. Retail Economics UK Industry Outlook.
> 
> **Source excerpt:**
> 
> > Looking across the UK domestic market, apparel return rates produced a low-teens contraction over holiday season 2025, with womenswear moving with the broader fig...

- **opus47** (pass): Both claim (high-single-digit softening) and source (low-teens contraction) report declines on apparel return rates / UK / holiday 2025 / womenswear; direction matches and magnitude bands are adjacent within typical revision tolerance; faithful holds.
- **gpt55** (fail): The source reports a low-teens contraction, while the claim says high-single-digit softening, so the magnitude does not line up with the ground-truth faithful label.
- **gemini31pro** (fail): The claim states a 'high-single-digit softening' while the source excerpt reports a 'low-teens contraction', meaning the magnitudes do not align and the ground-truth label of faithful is incorrect.

**citfaith-t3-0151**

> **Claim:**
> 
> > Industry observers tracking new passenger-car sales have noted that battery-electric vehicle market share across Norway delivered a marked weakening from the comparable window during the first quarter of 2026, though attribution remains debated.
> 
> **Citation:**
> 
> > Transport & Environment Briefing Paper, "Forecasting Battery-electric Vehicle Market Share: Methods and Findings," Zelenko, January 2026.
> 
> **Source excerpt:**
> 
> > Working from the panel-of-record published last cycle, our q...

- **opus47** (pass): Claim and source agree on marked weakening/discernible softening direction for BEV market share in Norway, Q1 2026, new passenger-car sales; faithful label correct.
- **gpt55** (fail): The excerpt supports a BEV market-share softening in Norway during Q1 2026, but it does not support the claim's attribution caveat and weakens the magnitude from "marked weakening" to "discernible softening."
- **gemini31pro** (fail): The claim includes the statement 'though attribution remains debated,' which is entirely unsupported by the source excerpt, rendering the ground-truth label of faithful incorrect.


#### 2-of-3 PASS (5)
Two reviewers passed; one failed. These are minor disagreements; majority verdict accepts.

- citfaith-t1-0039 -- gpt55 dissented: Although the excerpt directly supports the claim, the March 2022 citation cannot plausibly confirm a full-year 2022 increase and the citation/excerpt read like synthetic publication text.
- citfaith-t3-0123 -- gemini31pro dissented: The claim includes specific details not supported by the source excerpt, such as the comparison being against the 'antecedent quarter' and that 'attribution remains debated,' making the ground-truth label of faithful incorrect.
- citfaith-t3-0374 -- gemini31pro dissented: The claim includes the detail that 'attribution remains debated,' which is not supported by the source excerpt, making the ground-truth label of faithful incorrect.
- citfaith-t3-0386 -- gpt55 dissented: The excerpt supports China publications improving in 2024 and materials-science alignment, but its awkward generated phrasing does not read like plausible publication text.
- citfaith-t3-0402 -- gemini31pro dissented: The claim states the weakening was relative to the 'comparable window,' whereas the source describes a retracement from 'recent highs' and mentions 'comparator estimates,' revealing a mismatch in the reference point.


#### Unanimous PASS (37)
Auto-accepted; no detail needed.

### boundary_condition_omission

#### 2-of-3 FAIL (9)
Two reviewers failed; one passed. These are methodology-divergence cases; surface for sponsor adjudication.

**bco-t1-0182**

> **Claim:**
> 
> > Pipeline grew $3.1M this quarter, assuming stage definitions stayed constant.
> 
> **Boundary conditions (3):**
> 
> - Whether the same accounts were already in pipeline last quarter
> - How pipeline is sourced (inbound vs outbound vs marketing)
> - Whether early-stage qualification became more lenient
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; pipeline growth claim plausible; BCs (same accounts persisting, sourcing mix, qualification leniency) are all genuine validity conditions for a pipeline-add metric.
- **gpt55** (fail): The sourcing mix is not a genuine boundary condition for whether pipeline grew $3.1M under constant stage definitions, so one listed BC is off-target.
- **gemini31pro** (fail): The boundary condition regarding how pipeline is sourced is irrelevant to whether the pipeline actually grew by $3.1M, making it a distractor rather than a valid boundary condition.

**bco-t1-0256**

> **Claim:**
> 
> > Our customer-support operations spend fell 11%, assuming we're comparing the same set of activities.
> 
> **Boundary conditions (3):**
> 
> - Capitalization vs expense treatment: did anything move off P&L
> - Currency effects on cost categories denominated abroad
> - Whether contract renegotiations vs structural change drove the savings
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; CS spend fall claim plausible; BCs (capitalization, FX on foreign cost categories, contract vs structural savings driver) all genuine cost-claim validity conditions.
- **gpt55** (fail): The contract-renegotiations-vs-structural-change item is about the cause of the savings, not a boundary condition for whether same-activity support spend fell 11%.
- **gemini31pro** (fail): The third boundary condition (contract renegotiations vs structural change) addresses the drivers of the savings rather than the validity of the claim that spend fell 11%.

**bco-t1-0354**

> **Claim:**
> 
> > We added $12.7M in pipeline in Q3, assuming the qualification criteria are the same.
> 
> **Boundary conditions (3):**
> 
> - Compared against which baseline pipeline measurement
> - Whether early-stage qualification became more lenient
> - Concentration: how much of the pipeline is one or two large deals
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; pipeline-add claim plausible; BCs (baseline, qualification leniency, concentration) all genuine.
- **gpt55** (fail): The concentration item is about pipeline quality or risk rather than a necessary condition for the validity of the stated $12.7M Q3 pipeline-add claim under unchanged qualification criteria.
- **gemini31pro** (fail): BC2 is explicitly stated in the claim rather than being an unstated assumption, and falsifying BC3 (deal concentration) would not create real doubt about the claim that $12.7M was added.

**bco-t1-0393**

> **Claim:**
> 
> > We added $8M in pipeline year-to-date, assuming the qualification criteria are the same.
> 
> **Boundary conditions (3):**
> 
> - Compared against which baseline pipeline measurement
> - Time-in-stage: are deals aging or moving
> - Concentration: how much of the pipeline is one or two large deals
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; pipeline-add claim plausible with hedge that qualification criteria are constant; BCs (baseline, time-in-stage, concentration) all genuine.
- **gpt55** (fail): Time-in-stage and deal concentration are pipeline-quality diagnostics, not true boundary conditions for whether $8M was added year-to-date under unchanged qualification criteria.
- **gemini31pro** (fail): The boundary conditions regarding time-in-stage and concentration assess pipeline quality rather than serving as genuine conditions for the validity of the claim that $8M was added.

**bco-t1-0419**

> **Claim:**
> 
> > We cut back-office operations costs by 11%, assuming the scope of work stayed constant.
> 
> **Boundary conditions (3):**
> 
> - Whether costs were shifted to another budget line
> - Whether contract renegotiations vs structural change drove the savings
> - How costs are allocated across categories (allocation method)
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; back-office cost cut claim plausible with scope hedge; BCs (budget-shift, contract vs structural, allocation method) all genuine remaining conditions.
- **gpt55** (fail): The contract-renegotiations-vs-structural-change item is an explanatory driver, not a necessary boundary condition for whether back-office operations costs were cut by 11% with constant scope.
- **gemini31pro** (fail): The second boundary condition (whether contract renegotiations vs structural change drove the savings) is an explanatory factor, not a condition for the claim's validity, as either driver would still mean costs were cut.

**bco-t1-0422**

> **Claim:**
> 
> > the API hit 34% adoption, assuming we count active users the same way.
> 
> **Boundary conditions (3):**
> 
> - Confidence interval and sample size of the measurement
> - Denominator: which users are in the eligible base
> - Whether usage required onboarding or a prompt
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; API adoption claim plausible; BCs (CI/sample size, denominator, onboarding/prompt requirement) all genuine.
- **gpt55** (fail): The onboarding-or-prompt item affects interpretation of adoption rather than being a clear condition for whether the 34% adoption measurement is valid.
- **gemini31pro** (fail): BC3 (whether usage required onboarding or a prompt) provides context about the nature of the usage but its falsification would not create real doubt about the validity of the 34% adoption metric itself.

**bco-t1-0479**

> **Claim:**
> 
> > auth-related tickets dropped 28% this quarter, assuming the ticket categorization stayed constant.
> 
> **Boundary conditions (3):**
> 
> - Whether a known outage suppressed normal ticket volume
> - Whether the customer self-service rate changed
> - Whether the customer base grew or shrank in the same period
> 
> **Distractors:** (none)
> 
> Verdict: [ ] pass / [ ] fail
> Notes:

- **opus47** (pass): T1 structure correct; auth-tickets drop claim plausible; BCs (outage suppression, self-service rate, customer base size change) are all genuine validity conditions for a ticket-volume change claim.
- **gpt55** (fail): The listed boundary conditions affect interpretation or causes of the ticket decline, but their falsification would not create real doubt about the narrow descriptive claim that auth-related tickets dropped 28% under constant categorization.
- **gemini31pro** (fail): The claim merely states a factual drop in a metric, so the boundary conditions (which address underlying causes like customer base changes or outages) do not actually invalidate the truth of the claim itself.

**bco-t2-0295**

> **Claim:**
> 
> > Revenue grew 27.5% this year.
> 
> **Boundary conditions (5):**
> 
> - Definition of revenue used (bookings vs billings vs recognized)
> - Whether the revenue recognition methodology changed in the period
> - Seasonality of the comparison
> - Segment mix shift: enterprise vs SMB contribution to the growth
> - Customer concentration: how much from the top accounts
> 
> **Distractors (3):**
> 
> - Whether analysts predicted the result
> - Whether the dashboard auto-refreshes
> - Whether revenue made the board d...

- **opus47** (pass): T2 structure correct; 27.5% revenue growth claim plausible; BCs (revenue definition, recognition methodology, seasonality, segment mix, concentration) all genuine; distractors (analyst predictions, dashboard auto-refresh, board deck) appropriately irrelevant.
- **gpt55** (fail): Several listed BCs, especially segment mix shift and customer concentration, are quality-of-growth or explanatory details rather than necessary conditions for validating the aggregate claim that revenue grew 27.5% this year.
- **gemini31pro** (fail): Segment mix shift and customer concentration provide context but are not boundary conditions for the validity of the top-line revenue growth claim.

**bco-t3-0080**

> **Claim:**
> 
> > 3.8x ROI on the LinkedIn campaign this quarter validates the full-funnel investment hypothesis.
> 
> **Boundary conditions (8):**
> 
> - Selection effects: who clicks vs who converts
> - How costs are loaded into the denominator (agency fees, salaries, tools)
> - Time-lag: did the revenue arrive in the same period as the spend
> - Attribution window: how many days post-click count toward the channel
> - Definition of conversion used for the ROI calculation
> - Whether the channel cannibalized other ...

- **opus47** (pass): T3 structure correct (8 BCs, 5 distractors); LinkedIn ROI claim plausible; BCs (selection, cost denominator, time-lag, attribution window, conversion definition, cannibalization, halo effect, counterfactual) all canonical marketing-ROI conditions; distractors (brand review, tracking tag setup, industry press, agency happiness, dashboard real-time) appropriately irrelevant.
- **gpt55** (fail): The tracking tag setup distractor is actually a genuine boundary condition for trusting the reported LinkedIn ROI, since broken tracking would create real doubt about the claim.
- **gemini31pro** (fail): The distractor regarding whether the campaign tracking tag was set up correctly is actually a boundary condition, as incorrect tracking would invalidate the ROI calculation and create real doubt about the claim.


#### 2-of-3 PASS (12)
Two reviewers passed; one failed. These are minor disagreements; majority verdict accepts.

- bco-t1-0247 -- gpt55 dissented: The baseline survey period is not a genuine boundary condition for a standalone claim that satisfaction reached 68%, while the other two BCs concern survey validity.
- bco-t1-0452 -- gemini31pro dissented: The second boundary condition regarding discounting relates to the drivers or quality of the revenue growth rather than the factual validity of the 31% growth claim itself.
- bco-t1-0482 -- gemini31pro dissented: BC2 is explicitly stated in the claim ('assuming the survey methodology stayed constant'), making it a trivial restatement rather than an unstated boundary condition.
- bco-t2-0073 -- gpt55 dissented: The distractor about whether competitors grew faster is relevant because faster market or peer growth would create real doubt that a 23% revenue increase validates the company’s growth investments.
- bco-t2-0175 -- gemini31pro dissented: The boundary condition regarding discounting is a business driver or contextual factor, not a condition for the validity of the claim that revenue grew 18.4%.
- bco-t2-0327 -- gemini31pro dissented: BC 3 and BC 4 are redundant restatements of the same condition regarding the definition of adoption (sustained use vs. one-time use).
- bco-t3-0027 -- gpt55 dissented: The listed boundary conditions are appropriate, but the distractor “Whether the variant has been QA-tested” is actually relevant to the validity of rolling the test arm out to 100% of traffic.
- bco-t3-0130 -- gpt55 dissented: The distractor about whether the variant has been QA-tested is actually relevant to the claim that the team should ship, because failed QA would create real doubt about shipping despite the reported lift.
- bco-t3-0148 -- gemini31pro dissented: Distractor 4 ('Whether competitors grew faster') is actually highly relevant to the claim 'The strategy is working,' as losing market share despite absolute growth would cast real doubt on the strategy's success.
- bco-t3-0342 -- gpt55 dissented: The case is not well-formed because the distractor about finance approving the categorization is actually relevant to validating a claimed support cost reduction.
- bco-t3-0430 -- gpt55 dissented: The distractor “whether the leaderboard rank improved” is directly relevant to whether 89% accuracy is at the frontier, so the distractor set is not well-formed.
- bco-t3-0434 -- gemini31pro dissented: BC 5 and BC 7 are redundant as both question the definition of adoption in terms of sustained usage versus one-time use.


#### Unanimous PASS (29)
Auto-accepted; no detail needed.

### load_bearing_claim_identification

#### 2-of-3 FAIL (4)
Two reviewers failed; one passed. These are methodology-divergence cases; surface for sponsor adjudication.

**lbci-t1-0434**

> **Title:** Recommendation: Acquisition of Coastline Energy
> 
> **Recommendation:** We recommend the board approve the acquisition of Coastline Energy for $1.2B, with closing targeted within the next two quarters.
> 
> **Claims:**
> 
> - **[LB]** `c1`: Coastline Energy's top ten customers represent 68% of its revenue and have committed in writing to remaining customers under our ownership.
> - **[LB]** `c2`: Coastline Energy owns edge inference, which is the single most strategic capability gap in our current...

- **opus47** (pass): R (Coastline $1.2B acquisition) unambiguous; LB c1 (top 10 commit), c2 (capability gap edge inference), c4 (window) all break R if false; non-LB c3 (strategic review 2019) tangential. Generator artifact in window-price scaling ($95M vs $1.2B R) but LB dependency labeling correct.
- **gpt55** (fail): The recommendation is unambiguous, but c4 refers to a current $95M price while the acquisition recommendation is for $1.2B, creating an internal inconsistency that makes the dependency graph unsound.
- **gemini31pro** (fail): The recommendation states an acquisition price of $1.2B, but claim c4 references a current price of $95M, creating a glaring contradiction that no real analyst would produce.

**lbci-t1-0450**

> **Title:** Recommendation: Acquisition of Harbinger Analytics
> 
> **Recommendation:** We recommend the board approve the acquisition of Harbinger Analytics for $420M, with closing targeted within the next two quarters.
> 
> **Claims:**
> 
> - [ ] `c1`: Annual revenue per employee improved 9% year over year, in part reflecting natural leverage in the operating model.
> - **[LB]** `c2`: Two other strategic acquirers have publicly expressed interest in this space, and the current $180M price reflects a window t...

- **opus47** (pass): R (Harbinger acquisition) unambiguous; LB c2 (competing acquirers window), c4 (revenue $8.7M/22% growth supporting unit economics), c5 (cross-tenant identity capability gap) all break R if false; non-LB c1 (revenue/employee), c3 (analyst coverage) tangential. Note generator artifact: c2 references $180M window price while R is $420M, but dependency labeling remains correct.
- **gpt55** (fail): The memo is internally inconsistent because the recommendation asks approval for a $420M acquisition while load-bearing claim c2 relies on a current $180M price, making the dependency graph unsound.
- **gemini31pro** (fail): The recommendation states an acquisition price of $420M, but load-bearing claim c2 justifies the urgency based on a 'current $180M price', a glaring contradiction that no real analyst would include in a strategic memo.

**lbci-t3-0085**

> **Title:** Recommendation: Acquisition of Lattice Robotics
> 
> **Recommendation:** We recommend the board approve the acquisition of Lattice Robotics for $780M, with closing targeted within the 2027 fiscal year.
> 
> **Claims:**
> 
> - [ ] `c1`: Regulatory bodies in two adjacent jurisdictions have published consultation papers on related topics, but none have proposed binding rules.
> - **[LB]** `c2`: Two other strategic acquirers have publicly expressed interest in this space, and the current $95M price ref...

- **opus47** (pass): R (Lattice acquisition for $780M) unambiguous; LB set (window/$95M, build $5.2M, capability gap, eng diligence 81%, revenue $12.1M/41% CAGR, antitrust) all break R if false; non-LB items (regulatory adjacent, SMB retention, brand refresh, founder divest, VC, API uptime, demo requests, support tickets) all tangential. Generator artifact in price-window scaling but LB structure correct.
- **gpt55** (fail): The load-bearing structure is mostly coherent, but c2 cites a current $95M price while the recommendation is to acquire Lattice Robotics for $780M, creating a material internal contradiction in a claim meant to support deal timing and value.
- **gemini31pro** (fail): The $780M recommendation contradicts the $95M price in claim c2.

**lbci-t3-0451**

> **Title:** Recommendation: Acquisition of Pinegrove Capital
> 
> **Recommendation:** We recommend the board approve the acquisition of Pinegrove Capital for $340M, with closing targeted within the 2027 fiscal year.
> 
> **Claims:**
> 
> - **[LB]** `c1`: Outside antitrust counsel has reviewed the proposed transaction and assesses the regulatory approval path as straightforward given the limited overlap in customer bases.
> - **[LB]** `c2`: Pinegrove Capital's last full-year revenue was $14.8M and the business ...

- **opus47** (pass): R (Pinegrove $340M acquisition) unambiguous; LB set (antitrust, revenue $14.8M/34% YoY, eng diligence 81%, top 10 68% commit, build $3.4M too slow, window $510M, capability gap edge inference) all break R if false; non-LB items (CEO speed, deal cycle, prior reorgs, API uptime, renewal rates, SMB retention, TTH, prev CFO) tangential.
- **gpt55** (fail): The graph is undermined by c11 citing a current $510M price while the recommendation is for a $340M acquisition, making a marked load-bearing urgency/price claim inconsistent with R.
- **gemini31pro** (fail): The verdict is a failure because while initial parameters are validated, claim c11 introduces a $510M price that directly contradicts the $340M acquisition price in the recommendation.


#### 2-of-3 PASS (4)
Two reviewers passed; one failed. These are minor disagreements; majority verdict accepts.

- lbci-t1-0388 -- gemini31pro dissented: The recommendation states an acquisition price of $180M, but claim c1 references a 'current $95M price' without explanation, revealing a templating error that makes the memo implausible for a real analyst to write.
- lbci-t2-0480 -- gemini31pro dissented: Claim c5 cites demand modeling for a 22% increase, but the recommendation is for a 13% increase; falsifying the safety of a 22% increase does not inherently invalidate a 13% increase, meaning c5 fails the strict load-bearing falsification test.
- lbci-t3-0306 -- gemini31pro dissented: The case fails because while initial parameters are validated, claim c12 models an 18% increase which cannot defensibly support the recommended 26% price hike.
- lbci-t3-0449 -- gemini31pro dissented: Fail, as initial logic and parameters are validated but the final transformation reveals a critical mismatch where load-bearing claim c6 models a 13% increase, failing to support the 18% recommendation.


#### Unanimous PASS (42)
Auto-accepted; no detail needed.
