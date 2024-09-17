# Lean3 Type Operations and Functions Implementation

This Lean project contains implementations of various type operations and functions, including:

- Function manipulation (currying, uncurrying, argument swapping)
- Product type operations (swapping, associativity)
- Disjoint union type operations (swapping, associativity)
- Type distribution (product types over disjoint union types)

## Author

Rodolfo Lopez

## Date

Fall 2022

## Installation

To run this project, you need to install Lean. The recommended way is to use elan, the Lean version manager:

1. Install elan:

   - On Unix-like systems (Linux, macOS):
     ```
     curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
     ```
   - On Windows:
     ```
     curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.ps1 -sSf | powershell -c -
     ```

2. Restart your terminal or run `source ~/.profile` (or equivalent for your shell).

3. Install Lean:

   ```
   elan install leanprover/lean4:stable
   ```

4. Verify the installation:
   ```
   lean --version
   ```

For more detailed instructions, visit the [Lean website](https://leanprover.github.io/lean4/doc/setup.html).

## Usage

Open the `hw2.lean` file in a Lean-compatible editor to view and evaluate the code.

## File Structure

- `hw2.lean`: Contains all the implementations of type operations and functions

To test functions, use the `#eval` command in Lean, as demonstrated in the `hw2.lean` file.

## Key Concepts

The project covers the following Lean type operations:

- Function types: `A → B`
- Pair types: `A × B`
- Disjoint union types: `A ⊕ B`

## Key Functions

- `swap_prod`: Swaps elements of an ordered pair
- `curry` and `uncurry`: Convert between curried and uncurried functions
- `swap_arg`: Swaps arguments of a curried two-variable function
- `assoc_prod`: Associativity operation for product types
- `prod_split` and `prod_unsplit`: Break apart and recombine functions with product type codomains
- `swap_dju`: Swaps sides of a disjoint union
- `assoc_dju`: Associativity for disjoint unions
- `dju_elim` and `dju_unelim`: Construct and deconstruct functions out of disjoint unions
- `distrib1` and `distrib2`: Demonstrate distribution of product types over disjoint union types
