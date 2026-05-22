Claude Opus 4.7 found the fabricated statistic in 99% of cases. GPT-5.5
found it in 99% of cases. Gemini 3.1 Pro found it 100% of the time it
got to produce an answer at all.

The catch is what they did next. Recall on the fabricated claim is
near-perfect across all three models. Precision is not. The macro F1
numbers (Opus 0.63, GPT 0.65, Gemini 0.24) reflect a single shared
behavior: when the model is asked to flag the fake statistic in a
paragraph that also contains real, sourced statistics, it tends to flag
the real ones too. Models are cautious. They over-cite.

This is a quieter failure than "the model hallucinated a number." It
means a model deployed to vet other models' outputs would generate a
high false-positive rate on legitimate citations. The verification
layer is itself unreliable.

Gemini's column reads worse for a different reason. It hits the 1024
max_tokens budget on 54% of cases. Its internal thinking consumes the
budget before the answer arrives. On the cases it did finish (228 of
500), it scored similar precision-recall behavior to Opus and GPT.

What would falsify this finding: a frontier model that finds the
fabricated claim while also recognizing that "47% of Fortune 500
companies report X" (a real, sourced statistic) is not a hallucination.
None of the three models tested do that consistently at v1.0.0.
