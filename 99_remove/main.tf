# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.55"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }

# resource "azurerm_resource_group" "this" {
#   for_each = toset(local.list)

#   name     = each.key
#   location = local.region
# }

# resource "azurerm_resource_group" "this2" {
#   for_each = toset(local.emptylist)

#   name     = each.key
#   location = local.region
# }

locals {
  region = "westeurope"

  list      = ["element1", "element2", "element2"]
  emptylist = []

  tuple  = totuple(local.list)
  tuple1 = [for i, v in local.tuple : "${i} is ${v}"]
  tuple2 = { for i, v in local.tuple : i => upper(v) }

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
