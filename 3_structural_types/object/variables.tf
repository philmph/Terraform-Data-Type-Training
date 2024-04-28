# object is defined as `map(type)`
# For the key value, "" can be ommited except when they start with a number
variable "object" {
  default = {
    name     = "Philipp",
    age      = 31,
    location = "Vienna"
    adult    = true
  }
  type = object({
    name     = string
    age      = number
    location = string
    adult    = bool
  })
}

# Defaults per property are defined as optional()
variable "object_with_defaults_per_property" {
  default = {
    name     = "Philipp",
    age      = 31,
    location = "Vienna"
  }
  type = object({
    name     = string
    age      = number
    location = string
    adult    = optional(bool)
  })
}

variable "list_of_objects" {
  default = [
    {
      name     = "Philipp",
      age      = 31,
      location = "Vienna",
      adult    = true
    },
    {
      name     = "Someoneelse",
      age      = 14,
      location = "Berlin"
      adult    = false
    },
  ]
  type = list(object({
    name     = string
    age      = number
    location = string
    adult    = bool
  }))
}
