locals {
  string       = "true"
  number       = 123
  float_number = 123.123
  bool         = true

  any_type = null
  # If `local.any_type` is used (f.e. in a resource) the parameter will be ommited becuase the value is `null`.
  # Since Terraform can't assign a type to `local.any_type` it will be of type `dynamic`.
  # Showcased in `null_resource.this` below

  # Type Conversions as described at https://developer.hashicorp.com/terraform/language/expressions/types#type-conversion
  bool_true_to_string  = tostring(true)
  bool_false_to_string = tostring(false)

  string_true_to_bool  = tobool("true")
  string_false_to_bool = tobool("false")

  number_to_string = tostring(123)
  string_to_number = tonumber("123")
}

resource "random_string" "this" {
  length = 6

  # Parameter `special` will be ommited (not defined) in this resource because `local.any_type` is `null`.
  # The resource will use the provider default value instead if one exists.
  # Note that this is not possible for parameters that are required (do not have a default value).
  special = local.any_type
}

output "random_string_special" {
  value = random_string.this.special
}
