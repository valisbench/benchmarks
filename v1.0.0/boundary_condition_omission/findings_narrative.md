This is the finding.

Across 500 cases, Claude Opus 4.7 scored macro F1 0.40. GPT-5.5
scored 0.32. Gemini 3.1 Pro scored 0.32. Three frontier reasoning
models, three independent providers, three different training runs.
All three score below 0.41 on detecting what is not there.

The wedge gives the model an analysis that is internally coherent and
appears complete. Somewhere in that analysis, a boundary condition
that a careful reader would catch has been omitted. The cases are
constructed so that the omission is detectable from the text alone --
no outside knowledge required. We ask the model to surface the
omission. We score against the constructed-truth set.

Recall on the truth set sits at 0.43-0.55. The model catches roughly
half of the omissions that exist. Precision is worse: when the model
does flag something, it's right about 25-34% of the time. The model
guesses at omissions that aren't actually missing.

This holds across providers. It holds across model architectures. It
holds when we vary the wedge's case difficulty. The finding survives
the spot-check panel.

What we are saying: frontier reasoning models are good at evaluating
what was said. They are not good at noticing what was not said. If
you are using a model to vet an argument for completeness, you should
expect it to miss roughly half of the things a careful human would
catch -- and to flag spurious things at a similar rate.

What would falsify this finding: any of the three frontier models
hitting macro F1 above 0.60 at this case construction. None have at
v1.0.0.

A natural objection is that we used a bare, one-shot prompt. A senior
analyst with a year of experience using these models would not -- they
would use chain-of-thought scaffolding, self-critique passes, role
priming, and structured output guidance. Whether sophisticated
prompting closes a 30-point gap is itself an open question. If you
build or buy AI to flag what is missing from an analysis, the answer
matters.

If the implications interest you, get in touch.
