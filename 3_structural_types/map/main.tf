locals {
  # Note that this map and also complex_map below is going to be a object
  map = {
    name     = "Philipp",
    age      = "31",
    location = "Vienna"
  }

  # Referencing a value of a map
  map_ref = var.map["name"]

  complex_map = {
    Philipp = {
      age      = "31",
      location = "Vienna"
    },
    Someoneelse = {
      age      = "14",
      location = "Berlin"
    },
  }

  # Referencing a value of a complex map
  complex_map_ref = local.complex_map["Philipp"]["location"]

  # Note that this list of maps is going to be a tuple of objects
  list_of_maps = [
    {
      name     = "Philipp",
      age      = "31",
      location = "Vienna"
    },
    {
      name     = "Someoneelse",
      age      = "14",
      location = "Berlin"
    }
  ]

  # Referencing a value of a list of maps
  list_of_maps_ref = local.list_of_maps[0]["name"]

  # To specify them as map() the function tomap() needs to be used
  # Note that this is not required as a object also works fine for most usecases
  map_strongly_typed = tomap({
    name     = "Philipp",
    age      = "31",
    location = "Vienna"
  })

  complex_map_strongly_typed = tomap({
    Philipp = tomap({
      age      = "31",
      location = "Vienna"
    }),
    Someoneelse = tomap({
      age      = "14",
      location = "Berlin"
    }),
  })

  list_of_maps_strongly_typed = tolist([
    tomap({
      name     = "Philipp",
      age      = "31",
      location = "Vienna"
    }),
    tomap({
      name     = "Someoneelse",
      age      = "14",
      location = "Berlin"
    })
  ])

  # List Comprehension to show map identifiers
  list_comprehension = [for i, o in var.map : "Element ${o} is at identifier value ${i}"]

  # Advanced use of List Comprehension
  list_comprehension_advanced = [for i, o in var.map : "Element ${upper(o)} is at identifier value ${i}" if can(regex("[^\\d]", o))]

  # List Comprehension on complex map
  list_comprehension_complex = [for i, o in local.complex_map : [for k, l in o : "Element ${l} is at identifier value ${k} in map ${i} "]]

  # List Comprehension on list of maps
  list_comprehension_list = [for i, o in local.list_of_maps : [for k, l in o : "Element ${l} is at identifier value ${k} in map ${i} "]]

  # How to make this useful and usable in for_each? Create a map from the list with unique identifiers f.e.
  # Using the list position f.e. 0, 1, ... is not recommended as it will cause rebuilds on list change
  list_comprehension_list_to_map = { for o in local.list_of_maps : o.name => o }
}
