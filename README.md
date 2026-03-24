# OpenCompliance Lean4 Controls

This directory is the private source of truth for the first public export to `opencompliance-foundation/lean4-controls`.

It is intentionally narrow.

## What exists today

- a buildable Lean 4 package,
- a formal corridor for scoped MFA, audit logging, TLS ingress, machine credential hygiene, approved-region boundaries, and backup scheduling predicates,
- example modules aligned to the public synthetic proof bundles,
- and a first LegalLean-backed typed layer for `FormalisationBoundary`, risk acceptance defeats, discretionary terms, typed audit logging, and a reduced-corpus compliance solver whose runtime decisions now drive the minimal-family public corridors.

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

## Current typed boundary layer

- `OpenCompliance.Controls.Typed.TypedIdentity`
- `OpenCompliance.Controls.Typed.TypedLogging`
- `OpenCompliance.Controls.Typed.RiskAcceptance`
- `OpenCompliance.Controls.Typed.DiscretionaryTerms`
- `OpenCompliance.Controls.Typed.ComplianceSolver`

These modules do not widen the proved corridor automatically.
They now make the boundary between proof, attestation, defeat, and judgment
explicit in Lean and feed the runtime verdict path for the `minimal`, `failed`,
and `stale` synthetic corridors.

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
- no reference verifier that turns live evidence into Lean values automatically,
- no LegalLean runtime handoff yet for the wider `medium`, `issued`, `cyber-baseline`, or `ai-governance` corridors.
