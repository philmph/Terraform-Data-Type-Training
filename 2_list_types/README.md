# List Types

Available list types are

- `list`
- `set`
- `tuple` \*

\* Note that a `tuple` is not really a list type but uses the same syntax and referencing mechanism as a `list` does. A `tuple` is per definition a structural type used to group elements that belong together without the use of key value pairs. An example would be `["Philipp", 31, "Vienna"]`.

## Overview

| Type    | Syntax for Elements         | Type in Variables | Identifier            | Ordered | Usable in `for_each` |
| ------- | --------------------------- | ----------------- | --------------------- | ------- | -------------------- |
| `list`  | `[element1, element2, ...]` | `list(type)`      | `[0]`, `[1]`, `[...]` | Yes     | No \*\*              |
| `set`   | `[element1, element2, ...]` | `set(type)`       | Element itself        | No      | Yes                  |
| `tuple` | `[element1, element2, ...]` | `tuple([type])`   | `[0]`, `[1]`, `[...]` | Yes     | No \*\*              |

\*\* `list` and `tuple` can be used in `for_each` by converting them to a set beforehand using `toset()`.

## Key Take-Aways

- All three types are collections and all of them contain zero or more elements

- `list` and `set` require all elements to be of the same type

- When `list(any)` / `set(any)` is used, all cases that do not use `number` or `bool` exclusively will convert to `list(string)` / `set(string)`. This is because all values except `null` can be a `string` and Terraform will automatically convert

- `tuple` can have a different type per element

- Elements in `list` and `tuple` can be referenced with consecutive whole numbers starting with `[0]`

- `list` and `tuple` are ordered while a `set` is not

- When a `list` / `set` is defined using `[...]` without using `tolist()` / `toset()`, it will be a `tuple` as default behaviour

- When a `list(type)` / `set(type)` is defined for a variable `type` arguement it will be of the exact type

- Elements of a `list` and `set` are defined using `[element1, element2, ...]`. Outside of variables, the function `tolist()` / `toset()` is required to get the type `list` / `set`

Examples:

```hcl
my_list = tolist([1, 10, 100]) # Will be of type list(number)
my_list = tolist([true, false]) # Will be of type list(bool)
my_list = tolist(["1", 10, 100, false]) # Will be of type list(string)

my_set = toset([1, 10, 100]) # Will be of type set(number)
my_set = toset([true, false]) # Will be of type set(bool)
my_set = toset(["1", 10, 100, false]) # Will be of type set(string)
```

TODO relly?

- `sets` are unique values and unordered, they cannot be referenced with `[0]` or `["key"]`. Instead the element itself is it's identifier.

- Using a function like `max()` on a `list` / `set`, to retrieve the highest number, requires you to expand the `list` / `set` using `...` syntax. F.e. `max(var.my_list...)` / `max(var.my_set...)`.
