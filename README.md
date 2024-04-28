# Terraform Data Types Training

I will use this repository to showcases, uses and explains the various data types of Terraform.

All sub-folders contain a `README.md` which describes the contents of the folder.

- `README.md` explains the content of the folder.
- `variables.tf` shows how to define the Data Type. They are not used in the `main.tf` file.
- `main.tf` defines Variables in a `locals` block to show basic handling of the Data Type.

## Content

- [Simple Types](./1_simple_types/)
- [List Types](./2_list_types//)
- [Structural Types](./3_structural_types/)
- [Using `count`](./4_using_count/)
- [Using `for_each`](./5_using_for_each/)

## How to use

Switch into the desired folder, and run `terraform console`. Inspect variables and locals via CLI. `type()` is only available in `console` and very helpful to learn and understand `type()`.

## References

[Terraform Docs / Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types)
[Terraform Docs / Type Constraints](https://developer.hashicorp.com/terraform/language/expressions/type-constraints)
