locals {
  my_tuple = [1, 2]
  my_list  = tolist(local.my_tuple)
}
