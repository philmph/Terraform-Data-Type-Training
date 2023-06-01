# tuple is defined as `tuple([type_of_element_1, type_of_element_2, ...])`
# If the type for an element is unknown `any` can be used. It will transform into the best suited type
variable "tuple" {
  default = ["1", 2, "3", false, "2"]
  type    = tuple([string, number, string, bool, string])
}

# Will result in type tuple([string])
variable "tuple_any" {
  default = ["1"]
  type    = tuple([any])
}

locals {
  # Note that this list is going to be a tuple
  tuple_of_numbers = [1, 10, 100]

  # Note that this is commented out because it produces an error
  # max_number           = max(local.tuple_of_numbers)
  max_number_corrected = max(local.tuple_of_numbers...)

  # List Comprehension to show list identifiers
  list_comprehension = [for i, o in var.tuple : "Element ${o} is at identifier value ${i}"]

  # Advanced use of List Comprehension
  list_comprehension_advanced = [for i, o in var.tuple : "Element ${upper(o)} is at identifier value ${i}" if can(regex("[^\\d]", o))]
}
