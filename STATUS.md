# Lean4 Controls Status

## What exists today

- a compilable Lean 4 package,
- formal predicates for scoped MFA, audit logging, TLS ingress, machine credential hygiene, approved-region boundaries, and backup scheduling evidence,
- example theorems aligned to the synthetic public proof bundles,
- and a private generated-batch runner that typechecks the proved decidable slice for the current synthetic fixtures,
- explicit boundary notes for what remains outside the current corridor,
- a LegalLean dependency pinned through `lake-manifest.json`,
- a typed identity boundary module that expresses MFA as `FormalisationBoundary.formal` and training attestation as `FormalisationBoundary.boundary`,
- a typed logging boundary module that expresses the narrow audit-logging corridor as `FormalisationBoundary.formal`,
- a typed `Defeats` example for risk acceptance of the MFA obligation,
- a small typed inventory of discretionary compliance terms,
- and a first `LegalLean.Solver` instantiation for the minimal claim corpus, with runtime-consumed verdicts now live for the `minimal`, `failed`, and `stale` public corridors.

## What does not exist yet

- no JSON or OSCAL parser into Lean values,
- no released mapping library,
- no full-framework theorem set,
- no claim that the current corridor proves more than its narrow predicates,
- no LegalLean runtime handoff yet for the wider public corridors outside the minimal family.
