# This block shows how locals are defined with simple data types
locals {
  string           = "123"
  string_to_number = tonumber(local.string)

  number           = 123
  number_to_string = tostring(local.number)

  bool           = true
  bool_to_string = tostring(local.bool)

  string_to_bool = tobool("true")
}
