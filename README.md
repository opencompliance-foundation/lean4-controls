# OpenCompliance Lean4 Controls

This directory is the private source of truth for the first public export to `opencompliance-foundation/lean4-controls`.

It is intentionally narrow.

## What exists today

- a buildable Lean 4 package,
- a minimal formal corridor for scoped MFA and audit-logging predicates,
- and an example module aligned to the public synthetic proof bundle.

## Current corridor

- `AdministrativeMfaSatisfied`
- `AuditLoggingEnabled`
- `RetentionWindowDeclared`
- `NarrowAuditLoggingCorridor`

These are deliberately smaller than whole controls or whole frameworks.

## Build

```sh
lake build
```

## Public example linkage

The example theorems in `OpenCompliance/Examples/Minimal.lean` mirror the runtime facts in the public synthetic bundle under `examples/minimal/`.

## What does not exist yet

- no JSON or OSCAL ingestion,
- no broad control library,
- no proof that whole frameworks are satisfied,
- no reference verifier that turns live evidence into Lean values automatically.
