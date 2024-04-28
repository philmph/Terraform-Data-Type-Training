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

# Will also result in a tuple when not otherwise stongly typed with set() or list()
variable "any" {
  default = ["1"]
  type    = any
}
