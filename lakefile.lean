import Lake
open Lake DSL

package «opencompliance» where
  version := v!"0.1.0"
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib «OpenCompliance» where
  roots := #[`OpenCompliance]
