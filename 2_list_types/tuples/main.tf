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
