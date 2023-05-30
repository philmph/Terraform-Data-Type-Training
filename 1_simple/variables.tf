variable "string" {
  default = "123"
  type    = string
}

variable "number" {
  default = 123
  type    = number
}

# Note that floatin comma numbers in Terraform are also type number
variable "float_number" {
  default = 123.123
  type    = number
}

variable "bool" {
  default = true
  type    = bool
}
