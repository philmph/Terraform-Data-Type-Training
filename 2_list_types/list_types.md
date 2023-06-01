# List Types

Available list types are

- `list`
- `set`
- `tuple` \*

Key characteristics:

- They are collections with different characteristics and all of them contain zero or more entries
- `list` and `set` both require all elements to be of the same type. `tuple` can have different types per element.
- Only the elements of `list` and `tuple` can be identified / referenced with consecutive whole numbers starting with `0`

\* Note that a `tuple` is not really a list type but uses the same syntax and referencing mechanism as a `list` does. A `tuple` is used to group elements that belong together without the use of key value pairs. An example would be `["Philipp", 31, "Vienna"]`.

| Type    | Syntax for Elements         | Type in Variables | Identifier            | Ordered | Immutable | Usable in `for_each` |
| ------- | --------------------------- | ----------------- | --------------------- | ------- | --------- | -------------------- |
| `list`  | `[element1, element2, ...]` | `list(type)`      | `[0]`, `[1]`, `[...]` | Yes     | No        | No                   |
| `set`   | `[element1, element2, ...]` | `set(type)`       | -                     | No      | ?         | Yes                  |
| `tuple` | `[element1, element2, ...]` | `tuple([type])`   | `[0]`, `[1]`, `[...]` | Yes     | Yes       | No                   |

`list` and `tuple` can be used in `for_each` by converting them to a set beforehand using `toset()`.

## List

Syntax wise, `list` elements are defined using `[element1, element2, ...]`. The function `tolist()` is used to convert another type to a `list`. In variables, `list(type)` is used for the `type` argument.

`list` requires all elements to be of the same type.

When `list(any)` is used, all cases that do not use `number` or `bool` exclusively will convert to `list(string)`. This is because all values except `null` can be a `string`.

Examples:

```hcl
my_list = tolist([1, 10, 100]) # Will be of type list(number)
my_list = tolist([true, false]) # Will be of type list(bool)
my_list = tolist(["1", 10, 100, false]) # Will be of type list(string)
```

When a `list(type)` is defined for a variable `type` arguement it will be of the exact type.

When a `list` is defined in a `locals` block without using `tolist()`, it will be a `tuple` as default behaviour.

Using a function like `max()` on a list, to retrieve the hights number, requires you to expand the list using `...` syntax. F.e. `max(var.my_list...)`.

## Set

Syntax wise, `set` elements are defined using `[element1, element2, ...]`. The function `toset()` is used to convert another type to a `set`. In variables, `set(type)` is used for the `type` argument.

`set` requires all elements to be of the same type. Additionally, all elemets need to be unique (as they are also referenced by their definition).

When `list(any)` is used, all cases that do not use `number` or `bool` exclusively will convert to `list(string)`. This is because all values except `null` can be a `string`.

Examples:

```hcl
my_set = toset([1, 10, 100]) # Will be of type set(number)
my_set = toset([true, false]) # Will be of type set(bool)
my_set = toset(["1", 10, 100, false]) # Will be of type set(string)
```

When a `set(type)` is defined for a variable `type` arguement it will be of the exact type.

When a `set` is defined in a `locals` block without using `toset()`, it will be a `tuple` as default behaviour.

Using a function like `max()` on a list, to retrieve the hights number, requires you to expand the list using `...` syntax. F.e. `max(var.my_list...)`.

## Notes

# Type `set` is

# - unordered

# - can NOT contain duplicate values

# - is required to have all values to be of the same underlaying type

# - is defined as list(type) and any is the most generic version of it
