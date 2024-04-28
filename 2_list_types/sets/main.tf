locals {
  # Referencing like with lists and tuples is not possible with sets:

  # Elements of a set are identified only by their value and don't have any separate index or key to select with,
  # so it's only possible to perform operations across all elements of the set.

  # Note that this is commented out because it produces an error
  # any_1    = var.set_any[0]
  # any_1    = var.set_any["1"]

  # Note that this list is going to be a tuple
  set_of_numbers = [1, 10, 100]

  # To specify it as list() the function tolist([1, 10, 100]) needs to be used
  # Note that this is not required as a tuple also works fine for most usecases
  set_of_numbers_strongly_typed = toset([1, 10, 100])

  # Note that this is commented out because it produces an error
  # max_number           = max(local.set_of_numbers)
  max_number_corrected = max(local.set_of_numbers_strongly_typed...)

  # List Comprehension to show list identifiers
  list_comprehension = [for i, o in var.set_any : "Element ${o} is at identifier value ${i}"]

  # Advanced use of List Comprehension
  list_comprehension_advanced = [for i, o in var.set_any : "Element ${upper(o)} is at identifier value ${i}" if can(regex("[^\\d]", o))]

  # ! The list comprehensions show that there is no identifier 0, 1, ... in a set compared to `list` or `tuple`:
}
