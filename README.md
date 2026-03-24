# OpenCompliance Lean4 Controls

This directory is the private source of truth for the first public export to `opencompliance-foundation/lean4-controls`.

It is intentionally narrow.

## What exists today

- a buildable Lean 4 package,
- a formal corridor for scoped MFA, audit logging, TLS ingress, machine credential hygiene, approved-region boundaries, and backup scheduling predicates,
- and example modules aligned to the public synthetic proof bundles.

## Current corridor

- `AdministrativeMfaSatisfied`
- `AuditLoggingEnabled`
- `RetentionWindowDeclared`
- `NarrowAuditLoggingCorridor`
- `TlsIngressSatisfied`
- `NoUserManagedServiceAccountKeys`
- `ApprovedRegionBoundarySatisfied`
- `BackupSnapshotScheduleSatisfied`

These are deliberately smaller than whole controls or whole frameworks.

## Build

```sh
lake build
```

## Public example linkage

The example theorems in `OpenCompliance/Examples/Minimal.lean` and `OpenCompliance/Examples/Medium.lean` mirror the runtime facts in the public synthetic bundles under `examples/minimal/` and `examples/medium/`.

## What does not exist yet

- no JSON or OSCAL ingestion,
- no broad control library,
- no proof that whole frameworks are satisfied,
- no reference verifier that turns live evidence into Lean values automatically.
