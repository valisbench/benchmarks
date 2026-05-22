All three frontier models identify when "X because Y" is asserted
rather than supported. GPT-5.5 F1 on the unsupported label is 0.97.
Gemini 3.1 Pro is 0.94. Claude Opus 4.7 is 0.85.

This is a high ceiling. At 500 cases, mechanism_gap is the easy wedge.
Models can tell a mechanistic claim from a decorative one with high
accuracy.

The Opus number is the outlier worth flagging. 18 of 500 calls
returned `error_rate_limit` on Opus, against 0 for the other two
providers. That attrition is the difference between Opus's 0.85 F1
and the 0.94-0.97 the other two reach. With those 18 cases scored
instead of dropped, Opus's number lands in the same neighborhood.

What this finding does not measure: whether the model would catch
mechanism gaps in real prose where the structure is implicit. The
v1.0.0 cases are explicit "X because Y" sentences. A model that can
detect Y-is-unsupported in a one-sentence test may still miss it when
the claim is embedded in a paragraph of competent-sounding analysis.
v1.1 will test this.

What would falsify this finding: a frontier model that drops below
0.80 F1 on the unsupported label here. No published model has.
