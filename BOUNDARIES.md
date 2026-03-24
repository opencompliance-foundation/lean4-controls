# Lean Corridor Boundaries

This file states what the initial public Lean corridor proves and what it does not.

## Canonical typed boundary layer

The current Lean package now uses `LegalLean` as the canonical type vocabulary
for expressing proof boundaries.

- `FormalisationBoundary` is the canonical type for proof-tier classification.
- `TypedIdentity.lean` keeps `AdministrativeMfaSatisfied` as a narrow
  formalisable predicate and wraps it as `FormalisationBoundary.formal`.
- The adjacent training-attestation slice is represented as
  `FormalisationBoundary.boundary`, backed by a
  `RequiresHumanDetermination` instance instead of prose alone.
- `DiscretionaryTerms.lean` tags open-textured compliance language with
  `Vague` instances so those terms are machine-visible as judgment boundaries.
- `RiskAcceptance.lean` models a documented exception path through the
  `Defeats` relation rather than an informal waiver note.

Until `LegalLean` exposes compliance-specific authorities, the typed boundary
modules reuse `Authority.accc` as a proxy for an external certification or
assurance body. That proxy is explicit here so it remains visible and reviewable.

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

- `OpenCompliance.Controls.Typed.typedAdministrativeMfaResult`
  Lifts the same narrow MFA predicate into `FormalisationBoundary.formal`.
  This is the current typed equivalent for `EX-CLAIM-001`.

- `OpenCompliance.Controls.Typed.typedTrainingAttestationResult`
  Keeps the training slice at `FormalisationBoundary.boundary`.
  The point is explicit: a signed training attestation may exist, but whether it
  is sufficient for the control remains a `RequiresHumanDetermination` question.

- `OpenCompliance.Examples.exClaim103_proved`
  Corresponds to `EX-CLAIM-103` in the medium public proof bundle.
  It proves the narrow predicate that public ingress is HTTPS-only, uses managed certificates, and enforces TLS 1.2 or higher.

- `OpenCompliance.Examples.exClaim104_proved`
  Corresponds to `EX-CLAIM-104` in the medium public proof bundle.
  It proves the narrow predicate that scoped runtime service accounts do not use user-managed keys.

- `OpenCompliance.Examples.exClaim105_proved`
  Corresponds to `EX-CLAIM-105` in the medium public proof bundle.
  It proves the narrow predicate that the scoped workload has no undeclared regions, both the approved and observed region lists are non-empty, and the observed regions stay within the approved set.

- `OpenCompliance.Examples.exClaim106_proved`
  Corresponds to `EX-CLAIM-106` in the medium public proof bundle.
  It proves the narrow predicate that backup snapshots are enabled, have a declared schedule, and have a declared immutable window.

## Typed judgment inventory

The current typed open-texture inventory is small but explicit:

- `AppropriateTechnicalMeasures`
  Tagged as `Vague` to represent GDPR Article 32 style
  "appropriate technical and organisational measures".

- `AdequateAccessControls`
  Tagged as `Vague` to represent adequacy language in ISO 27001 / SOC 2 style
  access-control requirements.

- `ReasonableMonitoringCoverage`
  Tagged as `Vague` to represent "reasonable" monitoring coverage judgments.

These are not machine-proven. They are now machine-visible as boundary terms.

## Compliance solver boundary

`ComplianceSolver.lean` now instantiates `LegalLean.Solver` for the current
minimal-claim corpus.

- It proves reduced single-rule formal results for the two decidable minimal
  claims: scoped MFA and scoped audit logging.
- It proves that the remaining three minimal claims stay in boundary space
  under the current full corpus.
- It does not yet prove a full exact-corpus theorem set for every minimal
  claim in one pass, and it does not yet replace the Python runtime verdicts.

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
They also do not yet claim that the typed `LegalLean` layer is fully threaded
through the runtime trust-surface report. The stronger vocabulary is live in
Lean first.
