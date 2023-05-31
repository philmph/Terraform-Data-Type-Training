# Type `list` is
# - ordered and values can be referenced with [0], [1], ... starting at 0
# - can contain duplicate values
# - is required to have all values to be of the same underlaying type
# - is defined as list(type) and any is the most generic version of it

# In this example, list(any) will therefore result in a list(string).
# The variable `list_string` below, is the same.

# > type(var.list_any)
# list(string)
# > type(var.list_string)
# list(string)
variable "list_any" {
  default = [1, "2", false, 2]
  type    = list(any)
}

variable "list_string" {
  default = ["1", "2", "false", "2"]
  type    = list(string)
}

locals {
  list_any_1    = var.list_any[0]
  list_string_1 = var.list_string[0]

  # To use a function on a list, it needs to be expanded using `...`
  # If we do not use tolist() Terraform will create a tuple (which would also work).
  # Per default, we wouldn't write tolist()
  list_of_numbers = tolist([1, 10, 100])

  # Note that this is commented out because it produces an error
  # max_number           = max(local.list_of_numbers)
  list_max_number_corrected = max(local.list_of_numbers...)

  # List comprehension examples
  list_list_comp = [for i in var.list_string : i]
  list_map_comp  = { for k, v in var.list_string : k => v }

  # We return only strings that contain a number resulting in exclusion of [2] = "false"
  list_list_comp_advanced = [for i in var.list_string : i if can(regex("\\d", i))]
  list_map_comp_advanced  = { for k, v in var.list_string : k => v if can(regex("\\d", v)) }

  # Note that once again we receive a tuple instead of a list even with the list comprehension syntax above.
}
