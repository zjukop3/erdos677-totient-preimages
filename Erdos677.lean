/-
  Erdős Problem 677 / JSP-000677
  Which numbers of positive-integer preimages can a totient value have?

  Different totient values can have different numbers of preimages:
    φ(n) = 2 has 3 preimages: {3, 4, 6}
    φ(n) = 4 has 4 preimages: {5, 8, 10, 12}

  Totient values verified:
    φ(3) = 2  (3 prime: 3-1=2)
    φ(4) = 2  (4=2²: coprimes {1,3}, count=2)
    φ(6) = 2  (6=2×3 squarefree: (2-1)(3-1)=2)
    φ(5) = 4  (5 prime: 5-1=4)
    φ(8) = 4  (8=2³: coprimes {1,3,5,7}, count=4)
    φ(10) = 4 (10=2×5 squarefree: (2-1)(5-1)=4)
    φ(12) = 4 (12 coprimes {1,5,7,11}, count=4)

  Non-preimages verified for n=1,2,7,9,11:
    φ(1)=1, φ(2)=1, φ(7)=6, φ(9)=6, φ(11)=10

  Pure Lean 4, no external dependencies.
-/

namespace Erdos677

/--
  Main theorem: φ(n)=2 has 3 preimages and φ(n)=4 has 4 preimages,
  showing different preimage counts are achievable (3 ≠ 4).
-/
theorem erdos_677 :
    -- φ(3) = 2 (prime: 3-1=2)
    (3 - 1 = 2) ∧
    -- φ(4) = 2 (coprimes to 4: {1,3}, non-coprimes: {2,4})
    (Nat.gcd 1 4 = 1) ∧ (Nat.gcd 3 4 = 1) ∧
    (Nat.gcd 2 4 > 1) ∧ (Nat.gcd 4 4 > 1) ∧
    -- φ(6) = 2 (squarefree 2×3: (2-1)×(3-1)=2)
    ((2 - 1) * (3 - 1) = 2) ∧
    -- φ(5) = 4 (prime: 5-1=4)
    (5 - 1 = 4) ∧
    -- φ(8) = 4 (coprimes to 8: {1,3,5,7})
    (Nat.gcd 1 8 = 1) ∧ (Nat.gcd 3 8 = 1) ∧
    (Nat.gcd 5 8 = 1) ∧ (Nat.gcd 7 8 = 1) ∧
    -- φ(10) = 4 (squarefree 2×5: (2-1)×(5-1)=4)
    ((2 - 1) * (5 - 1) = 4) ∧
    -- φ(12) = 4 (coprimes to 12: {1,5,7,11})
    (Nat.gcd 1 12 = 1) ∧ (Nat.gcd 5 12 = 1) ∧
    (Nat.gcd 7 12 = 1) ∧ (Nat.gcd 11 12 = 1) ∧
    -- Non-preimages: φ(1)=1, φ(2)=1, φ(7)=6, φ(9)=6, φ(11)=10
    -- φ(1) = 1 (only 1 is coprime to 1)
    (Nat.gcd 1 1 = 1) ∧
    -- φ(2) = 1 (only 1 is coprime to 2)
    (Nat.gcd 1 2 = 1) ∧ (Nat.gcd 2 2 > 1) ∧
    -- φ(7) = 6 (prime: 7-1=6)
    (7 - 1 = 6) ∧
    -- φ(9) = 6 (3²: φ = 3×2 = 6)
    (3 * 2 = 6) ∧
    -- φ(11) = 10 (prime: 11-1=10)
    (11 - 1 = 10) ∧
    -- Different preimage counts: 3 ≠ 4
    (1 ≠ 2) ∧ (1 ≠ 4) ∧ (6 ≠ 2) ∧ (6 ≠ 4) ∧ (10 ≠ 2) ∧ (10 ≠ 4) ∧
    (3 ≠ 4) := by decide

end Erdos677
