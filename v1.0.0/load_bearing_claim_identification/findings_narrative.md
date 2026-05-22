All three frontier models perform near-perfectly on this wedge. GPT-5.5
macro F1 was 0.99. Claude Opus 4.7 was 0.98. Gemini 3.1 Pro was 0.92.

That last number understates Gemini's ability. Gemini hit the 1024
max_tokens budget on 101 of 500 cases. On the 399 it finished, its
performance matches the other two closely.

The interesting layer is tier 3 -- the hardest cases, where the
memo's dependency graph has 10-15 claims and the model must identify
which ones, if false, would collapse the recommendation. Opus and GPT
both scored above 0.97 macro F1 on tier 3. Gemini scored 0.86 on the
cases it finished.

Why this wedge is easier than the others: the cases are constructed
from a synthetic dependency graph. The ground truth is rule-derived,
not expert-labeled. We disclose this in the methodology callout at the
top of this page. v2 will commission expert labels on 80 real memos;
if expert-labeled F1 diverges from synthetic F1 by more than 0.15 on
any tier, v1 LBCI gets deprecated and a corrected version published.
That deprecation trigger is part of the anchored pre-registration.

What would falsify this finding: expert-labeled cases producing F1
below 0.85 on any tier where synthetic-labeled cases produced F1
above 0.97. We do not yet know whether that gap exists. The v2
expert-labeling program is the test.

For now: frontier models can identify load-bearing claims in
structured arguments. Whether they can do this on real-world memos
with implicit structure is not yet measured.
