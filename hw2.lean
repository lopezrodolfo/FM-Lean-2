-- Math 494 Homework #2
-- Rodolfo Lopez

-- The Lean standard library defines the following type operations:

-- Type of functions:         A → B         [ type → with \r or \to ]
-- Application of functions:  f a
-- Definition of functions:   λ (x : A), b  [ type λ with \Gl ]

-- Type of pairs:  A × B      [ type × with \x ]
-- Pair syntax:    ⟨ a , b ⟩  [ type ⟨ with \< and ⟩ with \> ]

-- Disjoint union type:  A ⊕ B  [ type ⊕ with \o+ ]
-- Injections:           inl a
--                       inr b
-- This one we need to open with:
open sum

-- For instance, here is the function that swaps the elements of any
-- ordered pair:
def swap_prod (A B : Type) (x : A × B) : B × A :=
  match x with
  | ⟨ a , b ⟩ := ⟨ b , a ⟩
  end

-- Multi-argument functions are generally represented in "curried"
-- form.  Here are functions that "curry" and "uncurry" two-variable
-- functions.  Note that "A × B → C" means "(A × B) → C" (we say "×
-- binds tighter than →" or "× has higher precedence than →"), while
-- "A → B → C" means "A → (B → C)" (we say "→ is right-associative").
def curry (A B C : Type) (f : A × B → C) : A → B → C :=
  λ (a : A), λ (b : B), f ⟨ a , b ⟩

def uncurry (A B C : Type) (f : A → B → C) : A × B → C :=
  λ (u : A × B), match u with
  | ⟨ a , b ⟩ := f a b
  end


-- Define a function that swaps the argument of a curried two-variable
-- function:
def swap_arg (A B C : Type) (f : A → B → C) : B → A → C :=
  λ (b: B), λ (a: A), f a b


-- Define the "associativity" operation for product types.  I've
-- included parentheses for clarity in both cases, but in fact Lean
-- declares × to be "right associative" too, so that "A × B × C" means
-- "A × (B × C)".
def assoc_prod (A B C : Type) (u : (A × B) × C) : A × (B × C) :=
  match u with
  | ⟨ ⟨ a, b ⟩ , c ⟩ := ⟨ a , ⟨ b, c ⟩ ⟩ 
  end


-- Given a function whose *codomain* is a product type, break it apart
-- into two functions.
def prod_split (A B C : Type) (f : A → B × C) : (A → B) × (A → C) :=
  ⟨(λ(a: A), match f a with | ⟨b, c⟩ := b end ), (λ(a:A), match f a with | ⟨b, c⟩ := c end)⟩ 

-- And put them back together:
def prod_unsplit (A B C : Type) (f : (A → B) × (A → C)) : A → B × C :=
  λ(a: A), match f with | ⟨g, h⟩ := ⟨g a, h a⟩ end


-- Define a function that swaps the two sides of a disjoint union:
def swap_dju (A B : Type) (u : A ⊕ B) : B ⊕ A :=
  match u with 
  | inl a := inr a
  | inr b := inl b
  end


-- And associativity for disjoint unions:
def assoc_dju (A B C : Type) (u : (A ⊕ B) ⊕ C) : A ⊕ (B ⊕ C) :=
  match u with 
  | inl(inl a) := inl a
  | inl(inr b) := inr(inl b)
  | inr c := inr(inr c)
  end


-- A function out of a disjoint union can be constructed from two
-- functions.  Note that ⊕ binds tighter than → as well.
def dju_elim (A B C : Type) (f : A → C) (g : B → C) : A ⊕ B → C :=
  λ(x: A ⊕ B), match x with
  |inl a := f a
  |inr b := g b 
  end

-- And broken apart into two functions.
def dju_unelim (A B C : Type) (h : A ⊕ B → C) : (A → C) × (B → C) :=
  ⟨(λ(a:A), h (inl a)), (λ(b:B), h (inr b))⟩ 


-- Just as multiplication of numbers distributes over addition of
-- numbers, "multiplication" of types (product types) distributes over
-- "addition" of types (disjoint union types).
def distrib1 (A B C : Type) (u : A × (B ⊕ C)) : (A × B) ⊕ (A × C) :=
  match u with 
  | ⟨a, inl b⟩ := inl⟨a, b⟩ 
  | ⟨a, inr c⟩ := inr⟨a, c⟩ 
  end

def distrib2 (A B C : Type) (v : (A × B) ⊕ (A × C)) : A × (B ⊕ C) :=
  match v with
  |inl ⟨a,b⟩ := ⟨a, inl b⟩ 
  |inr ⟨a,c⟩ := ⟨a, inr c⟩ 
  end