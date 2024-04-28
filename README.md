# Terraform Data Types Training

**_I will not be updating this Repository anymore after 28-04-2024._**

This Repository is used to showcases, uses and explain the data types of Terraform.

In sub-folders you will find the following files:

- `README.md` describes the contents of the folder
- `variables.tf` shows how a data type is defined as variable
- `main.tf` shows the syntax and handling of a data type in the code

## Content

- [Simple Types](./1_simple_types/README.md)
- [List Types](./2_list_types/README.md)
- [Structural Types](./3_structural_types/README.md)

## How to use

Switch into the desired folder, and run `terraform console`. Inspect variables and locals via CLI. Note that the function `type()` is only available in `terraform console` and is very helpful to learn and understand.

While writing and testing the code snippets, I've used `terraform` in version `v1.8.2` (Mac).

## References

[Terraform Docs / Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types)
[Terraform Docs / Type Constraints](https://developer.hashicorp.com/terraform/language/expressions/type-constraints)
