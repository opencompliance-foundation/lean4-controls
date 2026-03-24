# Lean Corridor Boundaries

This file states what the initial public Lean corridor proves and what it does not.

## Public example mapping

The current Lean package mirrors the synthetic bundles under `examples/minimal/` and `examples/medium/`.

- `OpenCompliance.Examples.exClaim001_proved`
  Corresponds to `EX-CLAIM-001` in the public proof bundle.
  It proves the narrow predicate that scoped administrative identities require MFA and conditional access is enabled.

- `OpenCompliance.Examples.exClaim002_proved`
  Corresponds to the proved portion of `EX-CLAIM-002` in the public proof bundle.
  It proves the narrow predicate that scoped audit logging is enabled.

- `OpenCompliance.Examples.exClaim002_supportingRetentionDeclared`
  Adds a supporting fact from the same example evidence: a positive retention window is declared.
  The current public proof bundle does not surface this as a separate claim.

- `OpenCompliance.Examples.exClaim103_proved`
  Corresponds to `EX-CLAIM-103` in the medium public proof bundle.
  It proves the narrow predicate that public ingress is HTTPS-only, uses managed certificates, and enforces TLS 1.2 or higher.

- `OpenCompliance.Examples.exClaim104_proved`
  Corresponds to `EX-CLAIM-104` in the medium public proof bundle.
  It proves the narrow predicate that scoped runtime service accounts do not use user-managed keys.

- `OpenCompliance.Examples.exClaim105_proved`
  Corresponds to `EX-CLAIM-105` in the medium public proof bundle.
  It proves the narrow predicate that the scoped workload has no undeclared regions and both the approved and observed region lists are non-empty.

- `OpenCompliance.Examples.exClaim106_proved`
  Corresponds to `EX-CLAIM-106` in the medium public proof bundle.
  It proves the narrow predicate that backup snapshots are enabled, have a declared schedule, and have a declared immutable window.

## What is intentionally outside the Lean corridor

- training completion attestations,
- restore exercise attestations,
- processor register attestations,
- DSR runbook attestations,
- whole-framework adequacy judgments,
- restore-test recency when no typed evidence exists,
- JSON ingestion,
- OSCAL ingestion,
- signing, witness logging, or certificate issuance.

## Interpretation rule

These theorems prove scoped predicates over explicit evidence values.

They do not prove that an organisation is fully compliant with ISO 27001, SOC 2, or any other framework.
