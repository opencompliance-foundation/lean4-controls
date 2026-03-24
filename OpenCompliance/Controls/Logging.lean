namespace OpenCompliance.Controls

structure AuditLoggingEvidence where
  auditLoggingEnabled : Bool
  retentionDays : Nat
deriving Repr, DecidableEq

def AuditLoggingEnabled (e : AuditLoggingEvidence) : Prop :=
  e.auditLoggingEnabled = true

def RetentionWindowDeclared (e : AuditLoggingEvidence) : Prop :=
  0 < e.retentionDays

def NarrowAuditLoggingCorridor (e : AuditLoggingEvidence) : Prop :=
  AuditLoggingEnabled e ∧ RetentionWindowDeclared e

theorem auditLoggingEnabled_of_flag
    (e : AuditLoggingEvidence)
    (henabled : e.auditLoggingEnabled = true) :
    AuditLoggingEnabled e := by
  exact henabled

theorem retentionWindowDeclared_of_positive
    (e : AuditLoggingEvidence)
    (hretention : 0 < e.retentionDays) :
    RetentionWindowDeclared e := by
  exact hretention

theorem narrowAuditLoggingCorridor_of_components
    (e : AuditLoggingEvidence)
    (henabled : AuditLoggingEnabled e)
    (hretention : RetentionWindowDeclared e) :
    NarrowAuditLoggingCorridor e := by
  exact And.intro henabled hretention

end OpenCompliance.Controls
