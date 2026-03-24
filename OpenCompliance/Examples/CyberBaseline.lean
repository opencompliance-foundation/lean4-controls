import OpenCompliance.Controls.Network

namespace OpenCompliance.Examples

def cyberBaselineNetworkBoundaryEvidence : OpenCompliance.Controls.NetworkBoundaryEvidence := {
  defaultDenyInbound := true
  declaredIngressPortsPresent := true
  undeclaredIngressPresent := false
  boundaryAttachedToIngressPath := true
  adminIngressRestricted := true
  approvedAdminSourceRangesDeclared := true
  unapprovedAdminIngressPresent := false
}

theorem exClaim602_proved :
    OpenCompliance.Controls.DefaultDenyNetworkBoundarySatisfied cyberBaselineNetworkBoundaryEvidence := by
  exact OpenCompliance.Controls.defaultDenyNetworkBoundarySatisfied_of_flags
    cyberBaselineNetworkBoundaryEvidence rfl rfl rfl

end OpenCompliance.Examples
