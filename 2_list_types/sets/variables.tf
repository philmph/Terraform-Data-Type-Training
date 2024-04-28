# set is defined as `set(type)`. In older Terraform versions (type) could be ommited
# It is recommended to write the full syntax version
variable "set_any" {
  default = ["1", 2, "3", false, "2"]
  type    = set(any)
}

variable "set_number" {
  default = [1, 2, 3, 2]
  type    = set(number)
}

variable "set_string" {
  default = ["1", "2", "3", "false", "2"]
  type    = set(string)
}
