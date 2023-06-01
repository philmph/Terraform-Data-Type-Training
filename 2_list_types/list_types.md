# List Types

Available list types are

- `list`
- `set`
- `tuple` \*

They are collections with different characteristics and all of them contain zero or more entries. `list` and `set` must contain only the same type while a `tuple` can have different types per entry. In contrast, only the elements of `list` and `tuple` can be identified / referenced with consecutive whole numbers starting with `0`.

\* Note that a `tuple` is not really a list type but uses the same syntax and referencing mechanism as a `list` does. A `tuple` is used to group a set of elements that belong together into a list without `keys` (with different types possible).

## List

Syntax wise, `list` values of a list are defined using `[element1, element2, ...]`. The function `tolist()` is used to convert another type to a `list`. In variables, `list(type)` is used for the `type` argument.

`list` requires all elements to be of the same type.

When `list(any)` is used, all cases that do not use `number` or `bool` exclusively will convert to `list(string)`. This is because all values except `null` can be a `string`.

Examples:

```hcl
my_list = [1, 10, 100] # Will be of type list(number)
my_list = [true, false] # Will be of type list(bool)
my_list = ["1", 10, 100, false] # Will be of type list(string)
```

When a `list(type)` is defined for a variable `type` arguement it will be of the exact type.

When a `list` is defined in a `locals` block without using `tolist()`, it will be a `tuple` as default behaviour.

Using a function like `max()` on a list, to retrieve the hights number, requires you to expand the list using `...` syntax. F.e. `max(var.my_list...)`.
