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

locals {
  # Referencing a value of a list
  any_1    = var.list_any[0]
  number_1 = var.list_number[0]
  string_1 = var.list_string[0]

  # Note that this list is going to be a tuple
  list_of_numbers = [1, 10, 100]

  # To specify it as list() the function tolist([1, 10, 100]) needs to be used
  # Note that this is not required as a tuple also works fine for most usecases
  list_of_numbers_strongly_typed = tolist([1, 10, 100])

  # Note that this is commented out because it produces an error
  # max_number           = max(local.list_of_numbers)
  max_number_corrected = max(local.list_of_numbers_strongly_typed...)

  # List Comprehension to show list identifiers
  list_comprehension = [for i, o in var.list_any : "Element ${o} is at identifier value ${i}"]

  # Advanced use of List Comprehension
  list_comprehension_advanced = [for i, o in var.list_any : "Element ${upper(o)} is at identifier value ${i}" if can(regex("[^\\d]", o))]

  # ! Note that once again we receive a tuple for the list comprehension instead of a list type
  # > type(local.list_comprehension)
  # tuple([
  #     string,
  #     string,
  #     string,
  #     string,
  # ])
  # > type(local.list_comprehension_advanced)
  # tuple([
  #     string,
  # ])
}
