# OpenCompliance Lean4 Controls

This directory is the private source of truth for the first public export to `opencompliance-foundation/lean4-controls`.

It is intentionally narrow.

## What exists today

- a buildable Lean 4 package,
- a formal corridor for scoped MFA, unique named infrastructure identities, audit logging, TLS ingress, managed ingress-boundary attachment, administrative-ingress restriction, plaintext-transport disablement, encryption at rest for scoped customer data stores, machine credential hygiene, approved-region boundaries, backup scheduling predicates, and a default-deny cyber-baseline network boundary,
- example modules aligned to the public synthetic proof bundles,
- and a first LegalLean-backed typed layer for `FormalisationBoundary`, risk acceptance defeats, discretionary terms, typed audit logging, and a reduced-corpus compliance solver whose runtime decisions now drive the minimal-family public corridors.

## Current corridor

- `AdministrativeMfaSatisfied`
- `UniqueInfrastructureAuthenticationSatisfied`
- `AuditLoggingEnabled`
- `RetentionWindowDeclared`
- `NarrowAuditLoggingCorridor`
- `TlsIngressSatisfied`
- `ManagedIngressBoundaryAttached`
- `AdministrativeIngressRestricted`
- `PlaintextTransportDisabled`
- `EncryptionAtRestSatisfied`
- `NoUserManagedServiceAccountKeys`
- `ApprovedRegionBoundarySatisfied`
- `BackupSnapshotScheduleSatisfied`
- `DefaultDenyNetworkBoundarySatisfied`

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

The example theorems in `OpenCompliance/Examples/Minimal.lean`, `OpenCompliance/Examples/Medium.lean`, and `OpenCompliance/Examples/CyberBaseline.lean` mirror the runtime facts in the public synthetic bundles under `examples/minimal/`, `examples/medium/`, and `examples/cyber-baseline/`. The medium example now also includes the scoped encryption-at-rest theorem and the unique-infrastructure-authentication theorem used by the blocked medium corridor and the issued certificate-eligible slice.

## What does not exist yet

- no JSON or OSCAL ingestion,
- no broad control library,
- no proof that whole frameworks are satisfied,
- no reference verifier that turns live evidence into Lean values automatically,
- no LegalLean runtime handoff yet for the wider `medium`, `issued`, `cyber-baseline`, or `ai-governance` corridors.
