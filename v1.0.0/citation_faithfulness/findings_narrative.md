Claude Opus 4.7 won this wedge. F1 on the unfaithful label was 0.86.
GPT-5.5 was 0.77. Gemini 3.1 Pro was 0.79.

This is one of two wedges where Opus beat GPT-5.5. The other was
boundary condition omission, where everyone scored badly. Here, Opus
beats GPT by a margin that survives 500 cases.

The wedge: model sees a claim plus a candidate source. The source is
real; the pairing is constructed. About half the pairings are
faithful (the source supports the claim) and half are not. Model
flags which.

What's interesting is the asymmetry. Recall on the unfaithful label is
1.0 across all three models. They never miss an unfaithful citation.
The differentiator is precision: GPT and Gemini are more eager to
flag faithful citations as unfaithful. Opus is more careful. The
0.09-point F1 spread between Opus and GPT is entirely precision.

What this means in practice: a model deployed as a citation-checker
would catch fabricated citations reliably. It would also generate
false positives on real, supporting citations at a rate of roughly
1-in-4 to 1-in-6 depending on which model you use.

What would falsify this finding: a citation-checker that maintains
recall above 0.95 while precision exceeds 0.95. Across the published
v1.0.0 roster, precision lands at 0.76-0.85.
