# map is defined as `map(type)`
# For the key value, "" can be ommited except when they start with a number
variable "map" {
  default = {
    name     = "Philipp",
    age      = "31",
    location = "Vienna"
  }
  type = map(string)
}

variable "list_of_maps" {
  default = [
    {
      name     = "Philipp",
      age      = "31",
      location = "Vienna"
    },
    {
      name     = "Someoneelse",
      age      = "14",
      location = "Berlin"
    },
  ]
  type = list(map(string))
}
