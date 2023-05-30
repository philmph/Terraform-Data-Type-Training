# Terraform Data Types Training

This repo simply showcases some data type handling with inline comment blocks.

## How to use

The most useful Terraform function `type()` is not available during runtime so I can't properly showcase data types with `output`. Instead you will need to change into the directories (f.e. `./1_simple`) and run the code interactively using `terraform console`. For example:

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

Per default, most `[value, value]` definitions default to a `tuple`. Only enclosing the `[...]` in conversion function f.e. `tolist()`, `toset()` will result in the expected type. However, `tuple` is sufficient for the most usecases.

Since `sets` are unique values and unordered, they cannot be referenced with `[0]` or `["key"]`.

## References

[Terraform Docs / Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types)
[Terraform Docs / Type Constraints](https://developer.hashicorp.com/terraform/language/expressions/type-constraints)
