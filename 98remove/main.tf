variable "affe" {
  default = null
  type    = string
}

resource "null_resource" "this" {
  count = var.affe != null ? 1 : 0
}
