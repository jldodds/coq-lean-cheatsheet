import .option

open tactic lean lean.parser
open interactive interactive.types expr

local postfix *:9001 := many

namespace tactic.interactive

private
meta def specialize_get_name : expr → tactic name
| (app f _) := specialize_get_name f
| (local_const _ n _ _) := pure n
| _ := fail "Not an application of a local constant"

/-- The analogue of Coq's `specialize` tactic -/
meta def specialize (H : parse texpr) : tactic unit :=
  do result ← i_to_expr H,
     id ← specialize_get_name result,
     n ← get_unused_name id none,
     note n none result,
     to_remove ← get_local id, 
     tactic.clear to_remove,
     tactic.rename n id

universes u v

def congr_arg_f_equal {A : Sort u} {B : Sort v} {f f' : A → B}
  {x x' : A} : f = f' → x = x' → f x = f' x'
:= begin
intros H, induction H, intros H, induction H, reflexivity
end

/-- The analogue of Coq's `f_equal` tactic -/
meta def f_equal : tactic unit :=
  try (do apply ``(@congr_arg_f_equal),
  tactic.focus [ reflexivity <|> f_equal, try reflexivity ])

meta def apply_in_aux : expr → tactic expr
| (pi x info ty e) := do
     x' ← mk_meta_var ty,
     apply_in_aux (e.instantiate_var x')
| e := pure e

/-- The analogue of Coq's `apply _ in _` tactic.
    Usage: `apply e in H` in Coq corresponds to
           `apply_in H e` using this tactic in Lean
 -/
meta def apply_in (H : parse ident) (e : parse texpr) 
  : tactic unit := do
  e' ← i_to_expr e,
  ty_e ← infer_type e' >>= whnf,
  goal ← apply_in_aux ty_e,
  n ← get_unused_name H,
  tactic.assert n goal,
  tactic.apply e',
  He ← get_local H,
  any_goals (tactic.apply He),
  any_goals (do clear [H], rename n H)

end tactic.interactive
