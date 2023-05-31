locals {
  region = "westeurope"

  list      = ["element1", "element2", "element2"]
  emptylist = []

  # tuple  = totuple(local.list)
  # tuple1 = [for i, v in local.tuple : "${i} is ${v}"]
  # tuple2 = { for i, v in local.tuple : i => upper(v) }

  list1 = [for i, v in local.list : "${i} is ${v}"]
  list2 = { for i, v in local.list : i => upper(v) }

  set  = toset(local.list)
  set1 = [for i, v in local.set : "${i} is ${v}"]
  set2 = { for i, v in local.set : i => upper(v) }

  map = {
    key1 = "value1"
    key2 = "value2"
  }

  map1 = [for k, v in local.map : "${k} is ${upper(v)}"]
  map2 = { for k, v in local.map : k => upper(v) }

  multimap = {
    object1 = {
      name = "value1",
      age  = 10
    },
    object2 = {
      name = "value2",
      age  = 20
    }
  }
}

locals {
  my_list_of_maps = [
    {
      name    = "Me",
      surname = "AlsoMe"
    },
    {
      name    = "You",
      surname = "AlsoYou"
    },
  ]

  what_is_my_kv   = { for k, v in local.my_list_of_maps : v.name => { key = k, value = v } }
  what_is_my_kv_2 = [for i, v in local.my_list_of_maps : "${i} = ${v.name}"]
  what_is_my_kv_3 = [for o in local.my_list_of_maps : "${o.name} ${o.surname}"]
}
