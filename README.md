# Coq to Lean Tactic Cheatsheet
This is a guide for [coq](https://coq.inria.fr/) users getting into writing [lean](https://leanprover.github.io/) proofs.

Please PR your own or request additions via issue tracker or [lean gitter](https://gitter.im/leanprover_public/Lobby).

n/a doesn't mean it doesn't exist, only that I don't know about it.

The main table is for the Lean release v3.3.0.

| Coq Tactic | Lean Tactic | Notes |
| ---------- | ----------- | ------|
|  `;`       |   `;`       |       |
|  `.`       |   `,`       |       |
| `assumption` | `assumption`   |      |
| `admit` | `admit` | |
| `apply` | `eapply` | lean `apply` is coq `eapply` |
| `apply H in A` | `have A2 := H A` | Will create a new hypothesis A2, and A will persist, see [coq-tactic-substitutes.lean](coq-tactic-substitutes.lean) for a closer approximation |
| `assert` | `have` | |
| `auto`  | n/a | |
| `autorewrite` | n/a | `simp using <attribute>` approximates |
| `change` | `change` | |
| `change with` | n/a | |
| `clear` | `clear` | no `clear -` |
| `constructor` | `constructor` | | 
| `destruct` | `cases` | |
| `destruct x eqn:?` | `destruct x` | |
| `eapply` | `apply` | |
| `exact` | `exact` | |
| `exfalso` | `exfalso` | |
| `exists` | `existsi` | |
| `eexists` | `existsi _` | |
| `f_equal` | `apply congr_args` | only works if `f` is unary, see [coq-tactic-substitutes.lean](coq-tactic-substitutes.lean) for a closer approximation |
| `fail` | `fail_if_success {skip}` | |
| `first [A \| B \|.. \| X]` | `first [A B .. X]` | | 
| `generalize x` | `generalize : x = y` | `y` is name of the new variable, the name must be provided |
| `generalize dependent` | `revert` | |
| `idtac` | `skip` | `skip` does not print, succeeds trivially |
| `induction` | `induction` | | 
| `intro` | `intro` | |
| `intros` | `intros` | |
| `intuition` | n/a | |
| `inversion` | `cases` | Cases should be applied to dependent arguments first |
| `left` | `left` | |
| `omega` | n/a | smt support? |
| `pose` | `let` | |
| `pose proof` | `have` | |
| `progress` | n/a | lean tactics by convention should fail if they don't progress|
| `remember x as y eqn:h` | `generalize h : x = y` | names must be provided |
| `revert` | n/a | always dependent|
| `revert dependent` | `revert` | |
| `rewrite` | `rewrite`, `rw` | |
| `rewrite <-` | `rewrite <-`, `rw` | |
| `right` | `right` | |
| `simpl` | `dsimp` | to some approximation at least.. |
| `simpl in` | `dsimp at` | |
| `simpl in *` | `dsimp at *` | |
| `solve` | `solve1` | |
| `specialize (H e)` | `specialize (H e)` |  |
| `split` | `split` | |
| `subst x` | `subst x` | |
| `subst` | n/a | |
| `symmetry` | `symmetry` | |
| `transitivity` | `transitivity` | |
| `trivial` | `trivial` | |
| `try T` | `try {T}` | curly braces required |
| `typeclasses eauto` | `apply_instance` | |
| `unfold` | `unfold` | |
| `unfold in` | `unfold at` | |
| `unshelve eapply` | `fapply` | |

Similar options from Coq exist in Lean as well. Whereas Coq options are set and unset with the Vernacular `Set option` and `Unset option`, Lean options are set with `set option true` and unset with `set option false`. Here is a list of Coq options and their Lean versions:

| Coq option | Lean option | Notes |
|------------|-------------|-------|
| `Printing Implicit` | `pp.implicit` | |
| `Printing Universes` | `pp.universes` | |
| `Printing Notations` | `pp.notation` | |

And other Vernacular:

| Coq Vernacular | Lean directive | Notes |
|----------------|----------------|-------|
| `Opaque ident` | `attribute [irreducible] ident` | |
| `Transparent ident` | `attribute [reducible] ident` | |
| `Check term` | `#check term` | |
| `Print term` | `#print term` | |
| `Proof using P` | `include P` | `include P` makes `P` available to all proofs, as well as typeclass resolution if it is an instance. `omit P` un-includes `P` |

Variables and sections

| Coq construct | Lean construct | Notes |
| -             | -              | -     |
| `Variable`      | `parameter`      | only within a section. Lean `variable` does not automatically apply arguments within the section |
 
