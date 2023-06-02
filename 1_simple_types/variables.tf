variable "string" {
  default = "true"
  type    = string
}

variable "number" {
  default = 123
  type    = number
}

variable "float_number" {
  default = 123.123
  type    = number
}

variable "bool" {
  default = true
  type    = bool
}

# Will be of type `dynamic` meaning it depends on the type assigned to it at runtime.
variable "any_type" {
  default = null
}
