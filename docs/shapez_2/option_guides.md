# Custom blueprint shapes guide for shapez 2

## How does this work?

The `blueprint_shapes` option normally gives you a choice between different sets of blueprint shapes taken from the 
vanilla scenarios (or completely random shapes). However, you can also provide a list of custom shapes to be used for 
gaining blueprint points.

## How do I use it?

Instead of just writing a single option name like `regular` or `randomized`, you need to provide list **as a choice**.
"As a choice" means that you'll need to pack it into a list, see the examples down below for how to format it. 
The value has to be a list of shape codes surrounded by quotation marks (`"` or `'`). 
It needs to contain at least 1 and up to 5 shapes.

## Examples on how using this option could look like

```
shapez 2:
  ...
  blueprint_shapes:
    # The extra "- " is required in order to not break weighting
    # That however makes picking out a random list possible (if multiple are provided)
    - ["CuCuCuCu", "P-P-P-P-:RgRbRgRb", "Cr------:Cg------"]
```

```
shapez 2:
  ...
  blueprint_shapes:
    # Here is an example of providing multiple lists and even regular choices
    # A random set out of those 3 will be chosen
    - ["CuCuCuCu", "P-P-P-P-:RgRbRgRb", "Cr------:Cg------"]
    - ["SrCmSrCm", "crcrcrcr:P-P-P-P-:RgRbRgRb"]
    - insane
```

# Nested randomness in modifier-based options guide

## How does this work?

Modifier-based options (e.g. `Item Pool Modifiers`) natively support values like `random` or `random-range-0-5` to 
get a random amount of unique modifiers.
The options in this apworld additionally support nested lists to give more control over what modifiers should be rolled.

## How do I use it?

Instead of writing a modifier's name as an entry in the option, you can write a whole list, of which a random value 
should be chosen from.
Weighted lists, a `null` value for not choosing any modifier, and comma-separated modifiers in a single string 
(i.e. inbetween two `"`) for choosing multiple modifiers at once are supported as well.

## An example on how using this option could look like

```
shapez 2:
  ...
  item_pool_modifiers:
    # Always included:
    - Random starting processor
    # Only one of them will be included:
    - [Arbitrary research credits, Arbitrary platform capacity, Arbitrary blueprint credits]
    # 50% chance to include "Include blueprint credits":
    - [Include blueprint credits, null]
    # Either ONLY "Include blueprint credits" or "Unlock boosters with miners" AND "Unlock pipes with pumps" will be included:
    - [Include blueprint credits, "Unlock boosters with miners, Unlock pipes with pumps"]
```