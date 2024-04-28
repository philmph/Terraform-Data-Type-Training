# Structural Types

Available structural types are

- `map`
- `object`

## Overview

| Type     | Syntax for Elements             | Type in Variables      | Identifier | Usable in `for_each` |
| -------- | ------------------------------- | ---------------------- | ---------- | -------------------- |
| `map`    | `tomap({ key = value \n ... })` | `map(type)`            | `["key"]`  | Yes                  |
| `object` | `{ key = value \n ... }`        | `object({key = type})` | `["key"]`  | Yes                  |

## Key Take-Aways

- `map` requires all elements of all keys to be of the same type

- `object` can have a different type for elements of keys

- Elements in `map` and `object` can be referenced with the name of their key `["key"]`

- When a `map` is defined using `{ key = value \n ... }` without using `tomap()`, it will be a `object` as default behaviour

- When a `map(type)` is defined for a variable `type` arguement it will be of the exact type and not `object`

## Examples

```hcl
my_object = { key = "value" } # Will be of type object({ key: string, })

my_complex_object = {
  key = "value"
  key2 = 1
  key3 = true
}

# ^ Will be of type
# object({
#   key: string,
#   key2: number,
#   key3: bool,
# })

my_map = tomap({ key = "value" }) # Will be of type map(string)
my_map = tomap({ key = 1 })       # Will be of type map(number)
my_map = tomap({ key = true })    # Will be of type map(bool)

my_complex_map = tomap({
  key  = "value"
  key2 = 1
  key3 = true
})

# ^ Will be of type map(string)
```
