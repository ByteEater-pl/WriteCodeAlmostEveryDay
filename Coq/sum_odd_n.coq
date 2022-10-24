Fixpoint sum_odd_n (n:nat) : nat :=
match n with 0 => 0 | S p => 1 + 2 * p + sum_odd_n p end.
Lemma sq:
forall n:nat, sum_odd_n n = n*n.
intro.
induction n.
trivial.
simpl.
rewrite IHn.
rewrite <- plus_n_O.
assert ((n + n + n * n) = (n + n * S n)).
rewrite <- mult_n_Sm.
assert (forall x y z : nat, x + (y + z) = x + y + z).
induction x.
trivial.
intros.
rewrite plus_Sn_m.
rewrite plus_Sn_m.
rewrite plus_Sn_m.
assert (x + (y + z) = x + y + z).
exact (IHx y z).
rewrite H.
trivial.
apply eq_sym.
rewrite H.
assert (forall x y : nat, x + y = y + x).
induction x.
trivial.
intro.
rewrite plus_Sn_m.
assert (forall o : nat, S o = o + 1).
induction o.
trivial.
rewrite plus_Sn_m.
rewrite IHo.
trivial.
rewrite H0.
apply eq_sym.
rewrite H0.
apply eq_sym.
rewrite IHx.
apply eq_sym.
apply H.
rewrite <- H.
rewrite <- H.
apply f_equal2_plus.
trivial.
trivial.
rewrite H.
trivial.
Qed.
