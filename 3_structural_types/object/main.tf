locals {
  my_complex_map = tomap({
    key  = "value"
    key2 = 1
    key3 = true
  })

  # Same as in the map example but this time the default type is correct
  object = {
    name     = "Philipp",
    age      = 31,
    location = "Vienna",
    is_human = true
  }

  # ! Important to note the a key difference is, that the objects can consist of different types
  # > type(local.object)
  # object({
  #     age: number,
  #     is_human: bool,
  #     location: string,
  #     name: string,
  # })

  # Referencing a value of an object
  object_ref = var.object["name"]

  complex_object = {
    Philipp = {
      age      = 31,
      location = "Vienna"
      is_human = true
    },
    Someoneelse = {
      age      = 18,
      location = "Berlin"
      is_human = true
    },
  }

  # Referencing a value of a complex object
  complex_object_ref = local.complex_object["Philipp"]["location"]

  # This is going to be a tuple of objects
  list_of_objects = [
    {
      name     = "Philipp",
      age      = 31,
      location = "Vienna"
      is_human = true
    },
    {
      name     = "Someoneelse",
      age      = 18,
      location = "Berlin"
      is_human = true
    }
  ]

  # Referencing a value of a list of objects
  list_of_objects_ref = local.list_of_objects[0]["name"]

  # List Comprehension to show object identifiers
  list_comprehension = [for i, o in var.object : "Element ${o} is at identifier value ${i}"]

  # Advanced use of List Comprehension
  list_comprehension_advanced = [for i, o in var.object : "Element ${upper(o)} is at identifier value ${i}" if can(regex("[^\\d]", o))]

  # List Comprehension on complex object
  list_comprehension_complex = [for i, o in local.complex_object : [for k, l in o : "Element ${l} is at identifier value ${k} in object ${i}"]]

  # List Comprehension on list of objects
  list_comprehension_list = [for i, o in local.list_of_objects : [for k, l in o : "Element ${l} is at identifier value ${k} in object ${i}"]]

  # How to make this useful and usable in for_each? Create a object from the list with unique identifiers f.e.
  # Using the list position f.e. 0, 1, ... is not recommended as it will cause rebuilds on list change
  list_comprehension_list_to_object = { for o in local.list_of_objects : o.name => o }
}
