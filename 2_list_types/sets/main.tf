# Type `set` is
# - unordered
# - can NOT contain duplicate values
# - is required to have all values to be of the same underlaying type
# - is defined as list(type) and any is the most generic version of it

# In this example, set(any) will therefore result in a set(string).
# The variable `set_string` below, is the same.

# > type(var.list_any)
# list(string)
# > type(var.list_string)
# list(string)
variable "set_any" {
  default = [1, "2", false, 2]
  type    = set(any)
}

variable "set_string" {
  default = ["1", "2", "false", "2"]
  type    = set(string)
}

locals {
  # # To use a function on a set, it needs to be expanded using `...`
  # # If we do not use toset() Terraform will create a tuple (which would also work).
  # # Per default, we wouldn't write toset()
  set_of_numbers = toset([1, 10, 100, 10])

  # # Note that this is commented out because it produces an error
  # # max_number           = max(local.set_of_numbers)
  set_max_number_corrected = max(local.set_of_numbers...)

  # # List comprehension examples
  set_list_comp = [for i in var.set_string : i]
  set_map_comp  = { for k, v in var.set_string : k => v }

  # # We return only strings that contain a number resulting in exclusion of [2] = "false"
  # list_comp_advanced = [for i in var.list_string : i if can(regex("\\d", i))]
  # map_comp_advanced  = { for k, v in var.list_string : k => v if can(regex("\\d", v)) }

  # # Note that once again we receive a tuple instead of a list even with the list comprehension syntax above.
}
