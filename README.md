# Coq to Lean Tactic Cheatsheet
This is a guide for [coq](https://coq.inria.fr/) users getting into writing [lean](https://leanprover.github.io/) proofs.

Right now this is for my favorite tactics. Please PR your own or request additions via issue tracker or [lean gitter](https://gitter.im/leanprover_public/Lobby).

n/a doesn't mean it doesn't exist, only that I don't know about it.

| Coq Tactic | Lean Tactic | Notes |
| ---------- | ----------- | ------|
|  `;`       |   `;`       |       | 
| `assumption` | `assumption`   |      |
| `admit` | `admit` | |
| `apply` | n/a | lean `apply` is coq `eapply` |
| `apply H in A` | `note A2 := H A` | Will create a new hypothesis A2, and A will persist |
| `assert` | `assert` | |
| `auto`  | n/a | |
| `autorewrite` | n/a | `simp using <attribute>` approximates |
| `change` | `change` | |
| `change with` | n/a | |
| `clear` | `clear` | no `clear -` |
| `constructor` | `constructor` | | 
| `destruct` | `cases` | |
| `destruct x eqn:?` | `destruct x` | |
| `eapply` | `apply` | |
| `apply` | n/a | |
| `exact` | `exact` | |
| `exfalso` | `exfalso` | |
| `exists` | `existsi` | |
| `eexists` | `existsi _` | |
| `f_equal` | `apply congr_args` | |
| `fail` | `fail_if_success {skip}` | |
| `first [A | B |.. | X]` | `A <|> B <|> .. <|> X` | | |
| `generalize x` | `generalize x y` | `y` is name of the new variable, the name must be provided |
| `generalize dependent` | `revert` | |
| `idtac` | `skip` | `skip` does not print, succeeds trivially |
| `induction` | `induction` | | 
| `intro` | `intro` | |
| `intuition` | n/a | |
| `inversion` | n/a | |
| `left` | `left` | |
| `omega` | n/a | smt support? |
| `pose` | `pose` | |
| `pose proof` | `note` | |
| `progress` | n/a | lean tactics by convention should fail if they don't progress|
| `remember x as y eqn:h` | `generalize2 x y h` | names must be provided |
| `revert` | n/a | always dependent|
| `revert dependent` | `revert` | |
| `rewrite` | `rewrite`, `rw` | 
| `right` | `right` | |
| `simpl` | `dsimp` | to some approximation at least.. |
| `simpl in` | `dsimp at` | |
| `simpl in *` | `dsimp at *`| new versions |
| `solve` | `solve1` | |
| `specialize H x` | `note H2 := H x` | H remains |
| `split` | `split` | |
| `subst x` | `subst x` | |
| `subst` | n/a | |
| `symmetry` | `symmetry` | |
| `transitivity` | `transitivity` | |
| `trivial` | `trivial` | |
| `try T` | `try {T}` | curly braces required |
| `unfold` | `unfold` | |
| `unfold in` | `unfold at` | |

