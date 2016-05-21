open import Data.Integer
open import Data.Product
open import Data.Unit renaming (⊤ to Void; tt to it)
open import Function

Op₂ : Set → Set
Op₂ X = (X × X) → X
Op₁ : Set → Set
Op₁ X = X → X
Op₀ : Set → Set
Op₀ X = Void → X

CoOp₂ : Set → Set
CoOp₂ X = X → (X × X)
CoOp₁ : Set → Set
CoOp₁ X = X → X
CoOp₀ : Set → Set
CoOp₀ X = X → Void


record Arith (X : Set) : Set where
  field
    add : Op₂ X
    mult : Op₂ X
    zero : Op₀ X
    one : Op₀ X

record CoMonoid (X : Set) : Set where
  field
    dup : CoOp₂ X
    dispose : CoOp₀ X

record Counter (X : Set) : Set where
  field
    inc : CoOp₁ X
    dec : CoOp₁ X
    reset : CoOp₁ X

counter : Counter ℤ
counter = record { inc = _+ + 1
                 ; dec = _- + 1
                 ; reset = const (+ 0)
                 }

record Counter' (X : Set) : Set where
  field
    inc : Op₁ X
    dec : Op₁ X
    reset : Op₁ X

counter' : Counter' ℤ
counter' = record { inc = _+ + 1
                  ; dec = _- + 1
                  ; reset = const (+ 0)
                  }

record Cocounter (Hidden : Set) : Set where
  field
    value : Hidden → ℤ
    inc : Hidden → ℤ → Hidden
    dec : Hidden → ℤ → Hidden
    reset : Hidden → Hidden

