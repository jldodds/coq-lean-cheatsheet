#print or

inductive threeorfour : nat -> Prop 
| isthree : forall (n : nat),  n=3 -> threeorfour n
| isfour  : forall (n : nat),  n=4 -> threeorfour n


/-- Coq Inversion -> Lean cases -/
lemma threeorfour_def : forall n, threeorfour n -> n=3 ∨ n=4 :=
begin
intros,
/-Inversion here-/
cases a,
{ left, assumption},
{ right, assumption},
end