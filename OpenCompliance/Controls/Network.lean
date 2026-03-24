namespace OpenCompliance.Controls

structure TlsIngressEvidence where
  httpsOnly : Bool
  minTlsVersion12OrHigher : Bool
  managedCertificatesActive : Bool
deriving Repr, DecidableEq

def HttpsOnly (e : TlsIngressEvidence) : Prop :=
  e.httpsOnly = true

def TlsVersionAtLeast12 (e : TlsIngressEvidence) : Prop :=
  e.minTlsVersion12OrHigher = true

def ManagedCertificatesActive (e : TlsIngressEvidence) : Prop :=
  e.managedCertificatesActive = true

def TlsIngressSatisfied (e : TlsIngressEvidence) : Prop :=
  HttpsOnly e ∧ TlsVersionAtLeast12 e ∧ ManagedCertificatesActive e

theorem tlsIngressSatisfied_of_flags
    (e : TlsIngressEvidence)
    (hhttps : e.httpsOnly = true)
    (htls : e.minTlsVersion12OrHigher = true)
    (hcerts : e.managedCertificatesActive = true) :
    TlsIngressSatisfied e := by
  exact And.intro hhttps (And.intro htls hcerts)

end OpenCompliance.Controls
