namespace OpenCompliance.Controls

structure IdentityEvidence where
  mfaRequired : Bool
  conditionalAccessEnabled : Bool
deriving Repr, DecidableEq

structure InfrastructureAuthUniquenessEvidence where
  namedAccountsRequired : Bool
  sharedAccountsPresent : Bool
deriving Repr, DecidableEq

structure PasswordPolicyEvidence where
  minimumLengthAtLeast12 : Bool
  noMaximumLengthRestriction : Bool
  commonPasswordBlockingEnabled : Bool
deriving Repr, DecidableEq

def AdministrativeMfaSatisfied (e : IdentityEvidence) : Prop :=
  e.mfaRequired = true ∧ e.conditionalAccessEnabled = true

def UniqueInfrastructureAuthenticationSatisfied (e : InfrastructureAuthUniquenessEvidence) : Prop :=
  e.namedAccountsRequired = true ∧ e.sharedAccountsPresent = false

def ScopedPasswordPolicySatisfied (e : PasswordPolicyEvidence) : Prop :=
  e.minimumLengthAtLeast12 = true ∧
    e.noMaximumLengthRestriction = true ∧
    e.commonPasswordBlockingEnabled = true

theorem administrativeMfaSatisfied_of_flags
    (e : IdentityEvidence)
    (hmfa : e.mfaRequired = true)
    (hca : e.conditionalAccessEnabled = true) :
    AdministrativeMfaSatisfied e := by
  exact And.intro hmfa hca

theorem uniqueInfrastructureAuthenticationSatisfied_of_flags
    (e : InfrastructureAuthUniquenessEvidence)
    (hnamed : e.namedAccountsRequired = true)
    (hshared : e.sharedAccountsPresent = false) :
    UniqueInfrastructureAuthenticationSatisfied e := by
  exact And.intro hnamed hshared

theorem scopedPasswordPolicySatisfied_of_flags
    (e : PasswordPolicyEvidence)
    (hlength : e.minimumLengthAtLeast12 = true)
    (hnomax : e.noMaximumLengthRestriction = true)
    (hblock : e.commonPasswordBlockingEnabled = true) :
    ScopedPasswordPolicySatisfied e := by
  exact And.intro hlength (And.intro hnomax hblock)

end OpenCompliance.Controls
