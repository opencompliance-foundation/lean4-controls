import OpenCompliance.Controls.Backup
import OpenCompliance.Controls.Cryptography
import OpenCompliance.Controls.Identity
import OpenCompliance.Controls.Keys
import OpenCompliance.Controls.Location
import OpenCompliance.Controls.Logging
import OpenCompliance.Controls.Network

namespace OpenCompliance.Examples

def mediumBundleId : String :=
  "exampleco-medium-bundle-2026-03-24"

def mediumIdentityEvidence : OpenCompliance.Controls.IdentityEvidence := {
  mfaRequired := true
  conditionalAccessEnabled := true
}

def mediumAuditLoggingEvidence : OpenCompliance.Controls.AuditLoggingEvidence := {
  auditLoggingEnabled := true
  retentionDays := 180
}

def mediumTlsIngressEvidence : OpenCompliance.Controls.TlsIngressEvidence := {
  httpsOnly := true
  minTlsVersion12OrHigher := true
  managedCertificatesActive := true
  plaintextDisabled := true
}

def mediumEncryptionAtRestEvidence : OpenCompliance.Controls.EncryptionAtRestEvidence := {
  encryptionEnabled := true
  customerDataStoresCovered := true
  unencryptedStoresPresent := false
}

def mediumInfrastructureAuthUniquenessEvidence : OpenCompliance.Controls.InfrastructureAuthUniquenessEvidence := {
  namedAccountsRequired := true
  sharedAccountsPresent := false
}

def mediumPasswordPolicyEvidence : OpenCompliance.Controls.PasswordPolicyEvidence := {
  minimumLengthAtLeast12 := true
  noMaximumLengthRestriction := true
  commonPasswordBlockingEnabled := true
}

def mediumEnvironmentSegmentationEvidence : OpenCompliance.Controls.EnvironmentSegmentationEvidence := {
  customerBoundaryEnforced := true
  productionSeparatedFromNonProduction := true
  undeclaredCrossEnvironmentPathsPresent := false
}

def mediumNetworkBoundaryEvidence : OpenCompliance.Controls.NetworkBoundaryEvidence := {
  defaultDenyInbound := true
  declaredIngressPortsPresent := true
  undeclaredIngressPresent := false
  boundaryAttachedToIngressPath := true
  adminIngressRestricted := true
  approvedAdminSourceRangesDeclared := true
  unapprovedAdminIngressPresent := false
}

def mediumServiceAccountKeyEvidence : OpenCompliance.Controls.ServiceAccountKeyEvidence := {
  userManagedKeysPresent := false
  maxUserManagedKeyAgeDays := 0
}

def mediumApprovedRegionEvidence : OpenCompliance.Controls.ApprovedRegionEvidence := {
  approvedRegions := ["eu-west-1", "au-southeast-1"]
  observedRegions := ["eu-west-1", "au-southeast-1"]
  undeclaredRegionsPresent := false
}

def mediumBackupSnapshotEvidence : OpenCompliance.Controls.BackupSnapshotEvidence := {
  snapshotsEnabled := true
  snapshotFrequencyHours := 24
  immutableWindowDays := 30
}

theorem exClaim101_proved :
    OpenCompliance.Controls.AdministrativeMfaSatisfied mediumIdentityEvidence := by
  constructor <;> rfl

theorem exClaim102_proved :
    OpenCompliance.Controls.NarrowAuditLoggingCorridor mediumAuditLoggingEvidence := by
  refine And.intro ?_ ?_
  · rfl
  · unfold OpenCompliance.Controls.RetentionWindowDeclared mediumAuditLoggingEvidence
    decide

theorem exClaim103_proved :
    OpenCompliance.Controls.TlsIngressSatisfied mediumTlsIngressEvidence := by
  exact OpenCompliance.Controls.tlsIngressSatisfied_of_flags
    mediumTlsIngressEvidence rfl rfl rfl

theorem exClaim124_proved :
    OpenCompliance.Controls.ManagedIngressBoundaryAttached mediumNetworkBoundaryEvidence := by
  exact OpenCompliance.Controls.managedIngressBoundaryAttached_of_flags
    mediumNetworkBoundaryEvidence rfl rfl rfl rfl

theorem exClaim125_proved :
    OpenCompliance.Controls.AdministrativeIngressRestricted mediumNetworkBoundaryEvidence := by
  exact OpenCompliance.Controls.administrativeIngressRestricted_of_flags
    mediumNetworkBoundaryEvidence rfl rfl rfl rfl rfl rfl

theorem exClaim126_proved :
    OpenCompliance.Controls.PlaintextTransportDisabled mediumTlsIngressEvidence := by
  exact OpenCompliance.Controls.plaintextTransportDisabled_of_flags
    mediumTlsIngressEvidence rfl rfl

theorem exClaim127_proved :
    OpenCompliance.Controls.EncryptionAtRestSatisfied mediumEncryptionAtRestEvidence := by
  exact OpenCompliance.Controls.encryptionAtRestSatisfied_of_flags
    mediumEncryptionAtRestEvidence rfl rfl rfl

theorem exClaim128_proved :
    OpenCompliance.Controls.UniqueInfrastructureAuthenticationSatisfied mediumInfrastructureAuthUniquenessEvidence := by
  exact OpenCompliance.Controls.uniqueInfrastructureAuthenticationSatisfied_of_flags
    mediumInfrastructureAuthUniquenessEvidence rfl rfl

theorem exClaim130_proved :
    OpenCompliance.Controls.ScopedPasswordPolicySatisfied mediumPasswordPolicyEvidence := by
  exact OpenCompliance.Controls.scopedPasswordPolicySatisfied_of_flags
    mediumPasswordPolicyEvidence rfl rfl rfl

theorem exClaim129_proved :
    OpenCompliance.Controls.EnvironmentSegmentationSatisfied mediumEnvironmentSegmentationEvidence := by
  exact OpenCompliance.Controls.environmentSegmentationSatisfied_of_flags
    mediumEnvironmentSegmentationEvidence rfl rfl rfl

theorem exClaim104_proved :
    OpenCompliance.Controls.NarrowServiceAccountKeyCorridor mediumServiceAccountKeyEvidence := by
  exact OpenCompliance.Controls.narrowServiceAccountKeyCorridor_of_flags
    mediumServiceAccountKeyEvidence rfl rfl

theorem exClaim105_proved :
    OpenCompliance.Controls.ApprovedRegionBoundarySatisfied mediumApprovedRegionEvidence := by
  refine OpenCompliance.Controls.approvedRegionBoundarySatisfied_of_components mediumApprovedRegionEvidence ?_ ?_ ?_ ?_
  · simp [OpenCompliance.Controls.ApprovedRegionsDeclared, mediumApprovedRegionEvidence]
  · simp [OpenCompliance.Controls.ObservedRegionsDeclared, mediumApprovedRegionEvidence]
  · unfold OpenCompliance.Controls.ObservedRegionsWithinApproved mediumApprovedRegionEvidence
    native_decide
  · rfl

theorem exClaim106_proved :
    OpenCompliance.Controls.BackupSnapshotScheduleSatisfied mediumBackupSnapshotEvidence := by
  refine OpenCompliance.Controls.backupSnapshotScheduleSatisfied_of_components mediumBackupSnapshotEvidence ?_ ?_ ?_
  · rfl
  · unfold OpenCompliance.Controls.SnapshotFrequencyDeclared mediumBackupSnapshotEvidence
    decide
  · unfold OpenCompliance.Controls.ImmutableWindowDeclared mediumBackupSnapshotEvidence
    decide

end OpenCompliance.Examples
