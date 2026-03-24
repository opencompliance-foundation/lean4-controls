namespace OpenCompliance.Controls

structure IdentityEvidence where
  mfaRequired : Bool
  conditionalAccessEnabled : Bool
deriving Repr, DecidableEq

def AdministrativeMfaSatisfied (e : IdentityEvidence) : Prop :=
  e.mfaRequired = true ∧ e.conditionalAccessEnabled = true

theorem administrativeMfaSatisfied_of_flags
    (e : IdentityEvidence)
    (hmfa : e.mfaRequired = true)
    (hca : e.conditionalAccessEnabled = true) :
    AdministrativeMfaSatisfied e := by
  exact And.intro hmfa hca

end OpenCompliance.Controls
