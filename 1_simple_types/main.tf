variable "string" {
  default = "true"
  type    = string
}

variable "number" {
  default = 123
  type    = number
}

# Note that a floating number is also of the generic type 'number' in Terraform
variable "float_number" {
  default = 123.123
  type    = number
}

varible "bool" {
  default = true
  type    = bool
}

# Note that any type could be used here.
# If var.null is used when the value is set to 'null' the parameter will be ommited.
variable "null" {
  default = null
  type    = bool
}

# Type Conversions as described at https://developer.hashicorp.com/terraform/language/expressions/types#type-conversion
locals {
  bool_true_to_string  = tostring(true)
  bool_false_to_string = tostring(false)

  string_true_to_bool  = tobool("true")
  string_false_to_bool = tobool("false")

  number_to_string = tostring(123)
  string_to_number = tonumber("123")
}
