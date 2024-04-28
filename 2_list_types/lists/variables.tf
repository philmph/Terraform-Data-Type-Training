# list is defined as `list(type)`. In older Terraform versions (type) could be ommited
# It is recommended to write the full syntax version
variable "list_any" {
  default = ["1", 2, "3", false]
  type    = list(any)
}

variable "list_number" {
  default = [1, 2, 3]
  type    = list(number)
}

variable "list_string" {
  default = ["1", "2", "3", "false"]
  type    = list(string)
}
