GPT-5.5 gets it right 83% of the time. Gemini 3.1 Pro 81%. Opus 4.7
74%. F1 on the "stated unfalsifiable" label: 0.85 / 0.84 / 0.79.

The wedge asks the model to read a claim and decide whether the claim
could in principle be tested against reality. "Companies that
prioritize customer experience grow faster" is unfalsifiable as
written. "Companies with NPS above 50 grew revenue 12% YoY in 2024"
is falsifiable. Models are asked to distinguish the two.

All three pass the recall test. They almost never miss an
unfalsifiable claim (recall 1.0, 1.0, 0.996). What they get wrong is
in the other direction: they sometimes call a precise, falsifiable
claim "unfalsifiable" too. Precision is the differentiator.

Why this matters: a model deployed to flag "vague claims" in analysis
would systematically over-flag falsifiable but imprecise prose. The
model treats vagueness and unfalsifiability as the same thing. They
are not.

What would falsify this finding: a model that hits 0.95 F1 here while
maintaining precision above 0.85. The current frontier sits closer to
0.79 precision on the unfalsifiable label even when recall is
maximal.
