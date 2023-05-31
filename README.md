# Terraform Data Types Training

This repo simply showcases some data type handling with inline comment blocks.

## How to use

The Terraform function `type()` is not available for `plan` or `apply` so I can't properly showcase data types with `output`.

Instead you will need to change into the directories (f.e. `./1_simple_types`) and run the code interactively using `terraform console`. For example:

```bash
terraform console

> type(var.string)
string

> type(var.number)
number

> type(local.string_to_number)
number

> type(local.number_to_string)
string

> type(local.string_to_bool)
bool

# Operator expressions can also be tested
> var.string != "" ? 1 : 0
1
```

## Key take aways

A list `[]` f.e. `[value1, value2]` definition defaults to a `tuple`. Only enclosing the `[]` in a conversion function f.e. `tolist()`, `toset()` will result in the expected type. However, `tuple` is sufficient for the most usecases.

`list` and `set` require to be of the same type for all elements. Terraform will convert to `string` if this is not the case.

Both `lists` and `tuples` can be referenced with `[0..n]` starting at count `0`.

`sets` are unique values and unordered, they cannot be referenced with `[0]` or `["key"]`.

## References

[Terraform Docs / Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types)
[Terraform Docs / Type Constraints](https://developer.hashicorp.com/terraform/language/expressions/type-constraints)
