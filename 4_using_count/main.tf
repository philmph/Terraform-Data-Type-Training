# This file showcases how count can be used on simple data types to determine if a resource should be created
resource "null_resource" "string_compare" {
  count = var.string != "" ? 1 : 0
}

# length() on strings counts the characters
resource "null_resource" "string_compare_alternative" {
  count = length(var.string) > 0 ? 1 : 0
}

# This comparison is not very often used this way but works.
# Usually compare against != 0 to indicate the number is anything else but 0.
resource "null_resource" "number_compare" {
  count = var.number > 0 ? 1 : 0
}

# This example chains two values with logical 'AND'
# If both of them evaluate to true, count will be set to 1
resource "null_resource" "and_compare" {
  count = var.bool && var.number != 0 ? 1 : 0
}

# This example chains two values with logical 'OR'
# If one of them evaluates to true, count will be set to 1
resource "null_resource" "or_compare" {
  count = var.bool || var.number != 0 ? 1 : 0
}
