variable "string" {
  default = "123"
  type    = string
}

variable "number" {
  default = 123
  type    = number
}

# Note that a floating number is also of type 'number' in Terraform
variable "float_number" {
  default = 123.123
  type    = number
}

varible "bool" {
  default = true
  type    = bool
}

locals {
  string           = "123"
  string_to_number = tonumber(local.string)

  number           = 123
  number_to_string = tostring(local.number)

  bool           = true
  bool_to_string = tostring(local.bool)

  string_to_bool = tobool("true")
}
