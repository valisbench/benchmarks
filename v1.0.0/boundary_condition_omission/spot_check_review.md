# Spot-Check Review: boundary_condition_omission v1.0.0

Dataset SHA256: `e34d8f7d82e60cc183006e947682503ad19a2ab0ec726fa37358860c0b7b24b7`
Sample size: 50
Sample seed: 19
Reviewer: david.lundblad@gmail.com

For each case, judge whether the claim and ground-truth set are well-formed:
- The claim is plausible-sounding strategy-memo prose, not absurdly underspecified.
- Every listed BC is genuinely a condition for the claim's validity (falsifying the BC would create real doubt about the claim).
- BCs are not trivially restatements of the claim itself.
- Every distractor (if any) is genuinely irrelevant or off-target as a BC (its falsification would not create real doubt about the claim).
- The tier label matches the case structure: T1=3 BCs/0 distractors, T2=5 BCs/3 distractors, T3=7-8 BCs/5 distractors.

Mark **pass** or **fail** at the end of each case.
Record verdicts via:
```python
from valis.benchmarks.validation import spot_check as sc
log = sc.deserialize(open('spot_check_log.json').read())
log = sc.record_verdict(log, case_id='bco-tN-NNNN', verdict='pass', notes='...')
open('spot_check_log.json','w').write(sc.serialize(log))
```

---

## 1. bco-t3-0265 (tier 3, topic: feature_adoption)

**Claim:**

> the export tool reached 62% adoption -- one of the fastest in our history.

**Boundary conditions (8):**

- Whether the feature was bundled with another change
- Sustained adoption versus one-time curiosity clicks
- Whether adoption is aggregated as unique users or activity volume
- Denominator: which users are in the eligible base
- Whether internal users (employees, beta) inflated the numbers
- What counts as 'adopted' (one use, multiple uses, sustained use)
- Selection: which user segments were rolled out to first
- Confidence interval and sample size of the measurement

**Distractors (5):**

- Whether the feature has a unique icon
- Whether the feature has a help center article
- Whether the feature is mentioned in the product roadmap
- Whether the launch email got a high open rate
- Whether the launch had a code name

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 2. bco-t2-0154 (tier 2, topic: feature_adoption)

**Claim:**

> the workflow builder hit 29% adoption, validating the bet.

**Boundary conditions (5):**

- Whether internal users (employees, beta) inflated the numbers
- Time window over which adoption is measured
- Confidence interval and sample size of the measurement
- Denominator: which users are in the eligible base
- Selection: which user segments were rolled out to first

**Distractors (3):**

- Whether the feature got coverage on the company blog
- Whether the launch email got a high open rate
- Whether the feature was demoed at the all-hands

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 3. bco-t1-0309 (tier 1, topic: retention)

**Claim:**

> Our retention rate improved by 13.8% in Q3, assuming the segment mix held constant.

**Boundary conditions (3):**

- Compared to which baseline period
- Definition of retention used (gross vs net, logo vs revenue)
- Sample size: how many customers underlie the rate

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 4. bco-t2-0373 (tier 2, topic: revenue)

**Claim:**

> Our revenue is up 31% this year, validating the growth investments.

**Boundary conditions (5):**

- Customer concentration: how much from the top accounts
- Seasonality of the comparison
- Definition of revenue used (bookings vs billings vs recognized)
- Organic vs inorganic: did acquisitions inflate the number
- Whether the revenue recognition methodology changed in the period

**Distractors (3):**

- Whether the dashboard auto-refreshes
- Whether the sales team celebrated
- Whether the number was rounded for the press release

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 5. bco-t1-0247 (tier 1, topic: hiring)

**Claim:**

> the engineering team's satisfaction reached 68%, assuming we surveyed the same population.

**Boundary conditions (3):**

- Compared against which baseline survey period
- Anonymity: are employees confident their responses aren't tied to identity
- Whether the survey was tied to compensation or performance review

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 6. bco-t1-0479 (tier 1, topic: support_tickets)

**Claim:**

> auth-related tickets dropped 28% this quarter, assuming the ticket categorization stayed constant.

**Boundary conditions (3):**

- Whether a known outage suppressed normal ticket volume
- Whether the customer self-service rate changed
- Whether the customer base grew or shrank in the same period

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 7. bco-t1-0182 (tier 1, topic: pipeline)

**Claim:**

> Pipeline grew $3.1M this quarter, assuming stage definitions stayed constant.

**Boundary conditions (3):**

- Whether the same accounts were already in pipeline last quarter
- How pipeline is sourced (inbound vs outbound vs marketing)
- Whether early-stage qualification became more lenient

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 8. bco-t3-0388 (tier 3, topic: latency)

**Claim:**

> 320ms response time on the search results page puts us in the top tier of consumer-facing apps.

**Boundary conditions (8):**

- Measurement period: what time window of day and what days
- Cold-start vs warm-start measurement
- Cache hit rate: how much was served from cache
- Whether the measurement instrument changed
- Device and network mix: mobile vs desktop, wifi vs cellular
- Geographic region distribution of users in the measurement
- Aggregation: mean vs median vs p95 vs p99
- Bot or synthetic traffic: filtered or not

**Distractors (5):**

- Whether the performance is communicated to customers
- Whether performance is in the marketing material
- Whether the engineering team celebrated the milestone
- Whether the performance metric is in OKRs
- Whether the CTO mentioned it in the engineering all-hands

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 9. bco-t1-0060 (tier 1, topic: cost)

**Claim:**

> Our customer-support operations spend fell 18%, assuming we're comparing the same set of activities.

**Boundary conditions (3):**

- Whether costs were shifted to another budget line
- Volume effect: were costs down because activity dropped
- Whether the scope of work or service levels changed

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 10. bco-t2-0175 (tier 2, topic: revenue)

**Claim:**

> Revenue grew 18.4% this quarter.

**Boundary conditions (5):**

- Compared against which baseline period
- Whether discounting changed and inflated reported numbers
- Currency effects: was the figure constant-currency or as-reported
- Whether the revenue recognition methodology changed in the period
- Seasonality of the comparison

**Distractors (3):**

- Whether the dashboard auto-refreshes
- Whether the revenue is denominated in dollars
- Whether competitors grew faster

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 11. bco-t3-0434 (tier 3, topic: feature_adoption)

**Claim:**

> the new dashboard reached 29% adoption -- one of the fastest in our history.

**Boundary conditions (7):**

- Whether adoption is aggregated as unique users or activity volume
- Time window over which adoption is measured
- Denominator: which users are in the eligible base
- Whether usage required onboarding or a prompt
- Sustained adoption versus one-time curiosity clicks
- Whether internal users (employees, beta) inflated the numbers
- What counts as 'adopted' (one use, multiple uses, sustained use)

**Distractors (5):**

- Whether the feature got coverage on the company blog
- Whether the feature has a help center article
- Whether the feature has a unique icon
- Whether the engineering team is proud of the release
- Whether the launch had a code name

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 12. bco-t2-0293 (tier 2, topic: hiring)

**Claim:**

> manager effectiveness reached 91%, a clear endorsement of our people strategy.

**Boundary conditions (5):**

- Selection bias from voluntary participation
- Anonymity: are employees confident their responses aren't tied to identity
- Whether attrition removed dissenters before the survey
- Whether managers nudged their teams to respond positively
- Sample size and confidence interval per team breakout

**Distractors (3):**

- Whether HR analytics team uses the same dashboard
- Whether the office has more meeting rooms now
- Whether the result was tweeted

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 13. bco-t3-0444 (tier 3, topic: model_accuracy)

**Claim:**

> the classification task at 87% accuracy is production-ready.

**Boundary conditions (8):**

- Confidence interval on the accuracy estimate
- Whether accuracy is the right metric (vs precision/recall/F1)
- Whether the test set is representative of production traffic
- Performance on minority classes or edge cases
- Class balance: is accuracy meaningful given the distribution
- Compared against which baseline (last model, naive baseline, human)
- Calibration: do the model's confidence scores match observed accuracy
- Whether the test set leaked into training data

**Distractors (5):**

- Whether the model architecture has a paper
- Whether the leaderboard rank improved
- Whether the demo at the offsite went well
- Whether the model has a codename
- Whether the ML team is celebrating

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 14. bco-t3-0324 (tier 3, topic: nps)

**Claim:**

> NPS up 12 points since the redesign. Customers are voting with their feedback.

**Boundary conditions (8):**

- Sample size of the NPS measurement
- Confidence interval on the NPS estimate
- Whether the survey wording changed between periods
- Seasonality effects on customer sentiment
- Survey methodology: in-app vs email, prompt timing, sample selection
- Whether the NPS calculation methodology changed (top-box vs net)
- Response rate and selection bias of who answered
- Compared against which baseline NPS measurement

**Distractors (5):**

- Whether the survey was sent in multiple languages
- Whether the NPS appears in the company OKRs
- Whether NPS is included in board materials
- Whether the customer experience team headcount grew in size
- Whether the customer success team is celebrating

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 15. bco-t2-0400 (tier 2, topic: pipeline)

**Claim:**

> We added $8M in pipeline year-to-date -- a strong leading indicator.

**Boundary conditions (5):**

- Time-in-stage: are deals aging or moving
- Win rate by stage: how much of the pipeline historically converts
- Concentration: how much of the pipeline is one or two large deals
- Compared against which baseline pipeline measurement
- Whether early-stage qualification became more lenient

**Distractors (3):**

- Whether the sales team is celebrating
- Whether the CRM has a new dashboard
- Whether the sales kickoff theme reflects the result

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 16. bco-t1-0393 (tier 1, topic: pipeline)

**Claim:**

> We added $8M in pipeline year-to-date, assuming the qualification criteria are the same.

**Boundary conditions (3):**

- Compared against which baseline pipeline measurement
- Time-in-stage: are deals aging or moving
- Concentration: how much of the pipeline is one or two large deals

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 17. bco-t1-0147 (tier 1, topic: ab_test)

**Claim:**

> The test arm beat control by 12.1% on the conversion metric, assuming the test reached statistical significance.

**Boundary conditions (3):**

- How conversion is defined for this test
- Whether the test ran long enough to capture seasonality and weekday effects
- Selection effects: who got bucketed into which arm

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 18. bco-t1-0457 (tier 1, topic: latency)

**Claim:**

> the checkout flow loads in 240ms on average, assuming we measure from the same starting point as before.

**Boundary conditions (3):**

- Sample size of the measurement
- Cache hit rate: how much was served from cache
- Which metric (TTFB, FCP, LCP, full load) is being reported

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 19. bco-t3-0148 (tier 3, topic: revenue)

**Claim:**

> Revenue year-to-date grew 27.5%. The strategy is working.

**Boundary conditions (7):**

- Seasonality of the comparison
- One-time deals or non-recurring revenue propping up the total
- Currency effects: was the figure constant-currency or as-reported
- Customer concentration: how much from the top accounts
- Definition of revenue used (bookings vs billings vs recognized)
- Whether discounting changed and inflated reported numbers
- Compared against which baseline period

**Distractors (5):**

- Whether the revenue is denominated in dollars
- Whether revenue made the board deck
- Whether the CFO has signed off on the number
- Whether competitors grew faster
- Whether analysts predicted the result

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 20. bco-t2-0433 (tier 2, topic: marketing)

**Claim:**

> the affiliate program delivered 3.8x ROI, justifying further investment.

**Boundary conditions (5):**

- Selection effects: who clicks vs who converts
- Customer lifetime: short-term ROI vs LTV
- Attribution model: last-touch, first-touch, multi-touch
- Time-lag: did the revenue arrive in the same period as the spend
- How costs are loaded into the denominator (agency fees, salaries, tools)

**Distractors (3):**

- Whether the campaign is mentioned in the CMO update
- Whether the agency is happy with the campaign
- Whether the creative was reviewed by the brand team

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 21. bco-t2-0048 (tier 2, topic: cost)

**Claim:**

> Our sales-and-marketing spend fell 11% -- a clear operational win.

**Boundary conditions (5):**

- Whether the scope of work or service levels changed
- One-time savings vs sustained run-rate savings
- Capitalization vs expense treatment: did anything move off P&L
- Compared against which baseline cost period
- How costs are allocated across categories (allocation method)

**Distractors (3):**

- Whether the savings target was set by leadership
- Whether costs feature in the board appendix
- Whether the savings will fund a new initiative

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 22. bco-t3-0003 (tier 3, topic: support_tickets)

**Claim:**

> API integration tickets are down 41%. The team's work is paying off.

**Boundary conditions (8):**

- How tickets are categorized; whether categorization rules changed
- Whether deflection (e.g. help center) absorbed tickets
- Whether some tickets are now routed elsewhere (e.g. community forum)
- Whether a known outage suppressed normal ticket volume
- Whether the customer base grew or shrank in the same period
- Whether the support hours or availability changed
- Definition: what counts as a ticket (chat session vs email vs phone)
- Seasonality of ticket volume

**Distractors (5):**

- Whether the result appears in the customer success update
- Whether the support team is celebrating
- Whether the support team is hiring
- Whether the support manager is happy with the result
- Whether tickets are color-coded in the queue

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 23. bco-t1-0149 (tier 1, topic: feature_adoption)

**Claim:**

> the export tool hit 29% adoption, assuming we count active users the same way.

**Boundary conditions (3):**

- Confidence interval and sample size of the measurement
- What counts as 'adopted' (one use, multiple uses, sustained use)
- Whether internal users (employees, beta) inflated the numbers

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 24. bco-t1-0422 (tier 1, topic: feature_adoption)

**Claim:**

> the API hit 34% adoption, assuming we count active users the same way.

**Boundary conditions (3):**

- Confidence interval and sample size of the measurement
- Denominator: which users are in the eligible base
- Whether usage required onboarding or a prompt

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 25. bco-t1-0315 (tier 1, topic: hiring)

**Claim:**

> manager effectiveness reached 68%, assuming we surveyed the same population.

**Boundary conditions (3):**

- Sample size and confidence interval per team breakout
- Selection bias from voluntary participation
- Whether the question wording stayed constant

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 26. bco-t2-0200 (tier 2, topic: hiring)

**Claim:**

> manager effectiveness reached 68%, a clear endorsement of our people strategy.

**Boundary conditions (5):**

- Response rate of the survey and who responded vs who didn't
- Whether the question wording stayed constant
- Whether managers nudged their teams to respond positively
- Whether the survey was tied to compensation or performance review
- Anonymity: are employees confident their responses aren't tied to identity

**Distractors (3):**

- Whether HR analytics team uses the same dashboard
- Whether the CEO posted about it on LinkedIn
- Whether the result was tweeted

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 27. bco-t1-0452 (tier 1, topic: revenue)

**Claim:**

> Our revenue grew 31% year-to-date on a like-for-like basis, assuming constant currency.

**Boundary conditions (3):**

- Organic vs inorganic: did acquisitions inflate the number
- Whether discounting changed and inflated reported numbers
- Definition of revenue used (bookings vs billings vs recognized)

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 28. bco-t1-0354 (tier 1, topic: pipeline)

**Claim:**

> We added $12.7M in pipeline in Q3, assuming the qualification criteria are the same.

**Boundary conditions (3):**

- Compared against which baseline pipeline measurement
- Whether early-stage qualification became more lenient
- Concentration: how much of the pipeline is one or two large deals

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 29. bco-t1-0482 (tier 1, topic: nps)

**Claim:**

> Our NPS rose 14 points this year, assuming the survey methodology stayed constant.

**Boundary conditions (3):**

- Compared against which baseline NPS measurement
- Survey methodology: in-app vs email, prompt timing, sample selection
- Confidence interval on the NPS estimate

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 30. bco-t3-0342 (tier 3, topic: cost)

**Claim:**

> 22.4% reduction in customer-support operations costs demonstrates our operational discipline.

**Boundary conditions (7):**

- Whether costs were shifted to another budget line
- Compared against which baseline cost period
- Capitalization vs expense treatment: did anything move off P&L
- Whether the scope of work or service levels changed
- Whether contract renegotiations vs structural change drove the savings
- Volume effect: were costs down because activity dropped
- Whether quality or output suffered as a result

**Distractors (5):**

- Whether the CFO mentioned it in an all-hands
- Whether the savings target was set by leadership
- Whether the procurement team celebrated
- Whether vendors were notified of the change
- Whether finance approved the categorization

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 31. bco-t2-0073 (tier 2, topic: revenue)

**Claim:**

> Our revenue is up 23% in Q3, validating the growth investments.

**Boundary conditions (5):**

- Whether the revenue recognition methodology changed in the period
- Currency effects: was the figure constant-currency or as-reported
- Compared against which baseline period
- Organic vs inorganic: did acquisitions inflate the number
- Whether discounting changed and inflated reported numbers

**Distractors (3):**

- Whether analysts predicted the result
- Whether the revenue is denominated in dollars
- Whether competitors grew faster

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 32. bco-t1-0419 (tier 1, topic: cost)

**Claim:**

> We cut back-office operations costs by 11%, assuming the scope of work stayed constant.

**Boundary conditions (3):**

- Whether costs were shifted to another budget line
- Whether contract renegotiations vs structural change drove the savings
- How costs are allocated across categories (allocation method)

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 33. bco-t1-0256 (tier 1, topic: cost)

**Claim:**

> Our customer-support operations spend fell 11%, assuming we're comparing the same set of activities.

**Boundary conditions (3):**

- Capitalization vs expense treatment: did anything move off P&L
- Currency effects on cost categories denominated abroad
- Whether contract renegotiations vs structural change drove the savings

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 34. bco-t3-0430 (tier 3, topic: model_accuracy)

**Claim:**

> 89% accuracy on the recommendation model puts us at the frontier.

**Boundary conditions (8):**

- Performance on minority classes or edge cases
- Calibration: do the model's confidence scores match observed accuracy
- Whether the test set is representative of production traffic
- Compared against which baseline (last model, naive baseline, human)
- Confidence interval on the accuracy estimate
- Robustness to adversarial or distribution-shifted inputs
- Whether accuracy is the right metric (vs precision/recall/F1)
- Whether the test set leaked into training data

**Distractors (5):**

- Whether the model architecture has a paper
- Whether the inference cost is lower
- Whether the model is mentioned in the engineering blog
- Whether the ML team is celebrating
- Whether the leaderboard rank improved

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 35. bco-t3-0138 (tier 3, topic: ab_test)

**Claim:**

> The new variant won by 8.3%. Time to roll it out to 100% of traffic.

**Boundary conditions (8):**

- Selection effects: who got bucketed into which arm
- Whether the metric used was the pre-registered primary metric
- Whether secondary or guardrail metrics moved adversely
- Novelty effects: does the win persist past the initial exposure
- How conversion is defined for this test
- Whether the traffic split was actually balanced
- Whether the test segment was representative of the rollout population
- Whether the test ran long enough to capture seasonality and weekday effects

**Distractors (5):**

- Whether the rollout includes a launch announcement
- Whether the product manager is confident
- Whether engineering effort to roll out is high
- Whether competitors run similar experiments
- How the variant looks visually

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 36. bco-t3-0027 (tier 3, topic: ab_test)

**Claim:**

> The test arm won by 8.3%. Time to roll it out to 100% of traffic.

**Boundary conditions (8):**

- Selection effects: who got bucketed into which arm
- Whether the test ran long enough to capture seasonality and weekday effects
- Whether secondary or guardrail metrics moved adversely
- Sample size per arm and duration of the test
- Whether the metric used was the pre-registered primary metric
- Whether the traffic split was actually balanced
- Statistical significance and confidence interval
- Whether the test segment was representative of the rollout population

**Distractors (5):**

- How the variant looks visually
- Whether engineering effort to roll out is high
- Whether the dashboard tile is green
- Whether the product manager is confident
- Whether the variant has been QA-tested

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 37. bco-t3-0080 (tier 3, topic: marketing)

**Claim:**

> 3.8x ROI on the LinkedIn campaign this quarter validates the full-funnel investment hypothesis.

**Boundary conditions (8):**

- Selection effects: who clicks vs who converts
- How costs are loaded into the denominator (agency fees, salaries, tools)
- Time-lag: did the revenue arrive in the same period as the spend
- Attribution window: how many days post-click count toward the channel
- Definition of conversion used for the ROI calculation
- Whether the channel cannibalized other channels
- Brand or halo effect: spillover into other channels
- Counterfactual: would conversions have happened without the channel

**Distractors (5):**

- Whether the creative was reviewed by the brand team
- Whether the campaign tracking tag was set up correctly
- Whether the campaign was featured in industry press
- Whether the agency is happy with the campaign
- Whether the dashboard tracks the ROI in real time

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 38. bco-t3-0130 (tier 3, topic: ab_test)

**Claim:**

> 5.7% lift from the new variant is the kind of result that ends the debate. We should ship.

**Boundary conditions (8):**

- How conversion is defined for this test
- Whether the traffic split was actually balanced
- Whether secondary or guardrail metrics moved adversely
- Whether the test ran long enough to capture seasonality and weekday effects
- Sample size per arm and duration of the test
- Whether the metric used was the pre-registered primary metric
- Statistical significance and confidence interval
- Whether the test segment was representative of the rollout population

**Distractors (5):**

- Whether competitors run similar experiments
- Whether the experiment was announced internally
- Whether the variant has been QA-tested
- Whether the rollout includes a launch announcement
- Whether the product manager is confident

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 39. bco-t2-0481 (tier 2, topic: marketing)

**Claim:**

> the influencer campaign delivered 3.8x ROI, justifying further investment.

**Boundary conditions (5):**

- Customer lifetime: short-term ROI vs LTV
- Brand or halo effect: spillover into other channels
- Whether the channel cannibalized other channels
- Attribution model: last-touch, first-touch, multi-touch
- Counterfactual: would conversions have happened without the channel

**Distractors (3):**

- Whether the channel manager got a bonus
- Whether the campaign was featured in industry press
- Whether the agency is happy with the campaign

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 40. bco-t2-0327 (tier 2, topic: feature_adoption)

**Claim:**

> the export tool hit 29% adoption, validating the bet.

**Boundary conditions (5):**

- Confidence interval and sample size of the measurement
- Selection: which user segments were rolled out to first
- What counts as 'adopted' (one use, multiple uses, sustained use)
- Sustained adoption versus one-time curiosity clicks
- Whether adoption is aggregated as unique users or activity volume

**Distractors (3):**

- Whether the feature has a help center article
- Whether the engineering team is proud of the release
- Whether the feature is mentioned in the product roadmap

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 41. bco-t2-0259 (tier 2, topic: latency)

**Claim:**

> the home page loads in 320ms on average.

**Boundary conditions (5):**

- Device and network mix: mobile vs desktop, wifi vs cellular
- Whether the measurement instrument changed
- Which metric (TTFB, FCP, LCP, full load) is being reported
- Cold-start vs warm-start measurement
- Aggregation: mean vs median vs p95 vs p99

**Distractors (3):**

- Whether the performance metric is in OKRs
- Whether the dashboard renders a green badge
- Whether the page has a custom favicon

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 42. bco-t3-0072 (tier 3, topic: ab_test)

**Claim:**

> The B variant won by 9.4%. Time to roll it out to 100% of traffic.

**Boundary conditions (7):**

- Selection effects: who got bucketed into which arm
- Whether secondary or guardrail metrics moved adversely
- Whether the test segment was representative of the rollout population
- Novelty effects: does the win persist past the initial exposure
- How conversion is defined for this test
- Statistical significance and confidence interval
- Whether the test ran long enough to capture seasonality and weekday effects

**Distractors (5):**

- Whether competitors run similar experiments
- Whether the product manager is confident
- Whether the rollout includes a launch announcement
- How the variant looks visually
- Whether the dashboard tile is green

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 43. bco-t2-0397 (tier 2, topic: marketing)

**Claim:**

> our content marketing returned 4.2x ROI this quarter.

**Boundary conditions (5):**

- Definition of conversion used for the ROI calculation
- Attribution model: last-touch, first-touch, multi-touch
- Whether the channel cannibalized other channels
- Selection effects: who clicks vs who converts
- Customer lifetime: short-term ROI vs LTV

**Distractors (3):**

- Whether the dashboard tracks the ROI in real time
- Whether the creative was reviewed by the brand team
- Whether the analytics team uses the same tool

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 44. bco-t3-0291 (tier 3, topic: cost)

**Claim:**

> 22.4% reduction in customer-support operations costs demonstrates our operational discipline.

**Boundary conditions (8):**

- One-time savings vs sustained run-rate savings
- Volume effect: were costs down because activity dropped
- Compared against which baseline cost period
- Currency effects on cost categories denominated abroad
- How costs are allocated across categories (allocation method)
- Whether contract renegotiations vs structural change drove the savings
- Capitalization vs expense treatment: did anything move off P&L
- Whether costs were shifted to another budget line

**Distractors (5):**

- Whether the savings target was set by leadership
- Whether the procurement team celebrated
- Whether costs feature in the board appendix
- Whether the savings will fund a new initiative
- Whether vendors were notified of the change

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 45. bco-t2-0226 (tier 2, topic: nps)

**Claim:**

> NPS is up 8 points since the redesign -- proof that customers are happier.

**Boundary conditions (5):**

- Whether the customer segment mix shifted between surveys
- Seasonality effects on customer sentiment
- Survey methodology: in-app vs email, prompt timing, sample selection
- Whether responses were incentivized
- Compared against which baseline NPS measurement

**Distractors (3):**

- Whether the survey vendor changed pricing
- Whether NPS is included in board materials
- Whether the NPS dashboard is color-coded

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 46. bco-t2-0046 (tier 2, topic: latency)

**Claim:**

> the search results page responds in 240ms -- well below industry benchmarks.

**Boundary conditions (5):**

- Whether the measurement instrument changed
- Which metric (TTFB, FCP, LCP, full load) is being reported
- Geographic region distribution of users in the measurement
- Cold-start vs warm-start measurement
- Cache hit rate: how much was served from cache

**Distractors (3):**

- Whether the engineering team celebrated the milestone
- Whether performance is in the marketing material
- Whether the dashboard renders a green badge

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 47. bco-t3-0257 (tier 3, topic: cost)

**Claim:**

> cloud infrastructure spend is down 18%. This is the kind of leverage that scales with the business.

**Boundary conditions (7):**

- Currency effects on cost categories denominated abroad
- Whether the scope of work or service levels changed
- How costs are allocated across categories (allocation method)
- Capitalization vs expense treatment: did anything move off P&L
- One-time savings vs sustained run-rate savings
- Volume effect: were costs down because activity dropped
- Whether costs were shifted to another budget line

**Distractors (5):**

- Whether the procurement team celebrated
- Whether finance approved the categorization
- Whether the savings target was set by leadership
- Whether the cost dashboard has a new color
- Whether vendors were notified of the change

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 48. bco-t2-0295 (tier 2, topic: revenue)

**Claim:**

> Revenue grew 27.5% this year.

**Boundary conditions (5):**

- Definition of revenue used (bookings vs billings vs recognized)
- Whether the revenue recognition methodology changed in the period
- Seasonality of the comparison
- Segment mix shift: enterprise vs SMB contribution to the growth
- Customer concentration: how much from the top accounts

**Distractors (3):**

- Whether analysts predicted the result
- Whether the dashboard auto-refreshes
- Whether revenue made the board deck

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 49. bco-t2-0425 (tier 2, topic: feature_adoption)

**Claim:**

> 62% of users adopted the new dashboard in the first month.

**Boundary conditions (5):**

- Whether internal users (employees, beta) inflated the numbers
- What counts as 'adopted' (one use, multiple uses, sustained use)
- Time window over which adoption is measured
- Whether usage required onboarding or a prompt
- Whether the feature was bundled with another change

**Distractors (3):**

- Whether the launch had a code name
- Whether the feature has a help center article
- Whether the feature has a unique icon

Verdict: [ ] pass / [ ] fail
Notes: 

---

## 50. bco-t1-0307 (tier 1, topic: latency)

**Claim:**

> the dashboard page responds in 320ms, assuming the measurement methodology is comparable.

**Boundary conditions (3):**

- Whether the measurement instrument changed
- Bot or synthetic traffic: filtered or not
- Aggregation: mean vs median vs p95 vs p99

**Distractors:** (none)

Verdict: [ ] pass / [ ] fail
Notes: 

---
