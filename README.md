# Terraform Data Types Training

This repo simply showcases some data type handling with inline comment blocks.

I am trying to keep this as structured and easy to follow through as possible. However, I found it to be very difficult to do so. For all folders contains a `main.tf` file the following applies:

- `variables.tf` shows how to define the Data Type. They are not used in the `main.tf` file.
- `main.tf` defines Variables in a `locals` block to show basic handling of the Data Type.
- `for.tf` show examples if the given Data Type has some kind of an identifier.

## How to use

The Terraform function `type()` is not available for `plan` or `apply` so I can't properly showcase data types with `output`.

Instead you will need to change into the directories (f.e. `./1_simple_types`) and run the code interactively using `terraform console`. Examples are given in the corresponding `.md` file in the folder.

## References

[Terraform Docs / Types and Values](https://developer.hashicorp.com/terraform/language/expressions/types)
[Terraform Docs / Type Constraints](https://developer.hashicorp.com/terraform/language/expressions/type-constraints)
