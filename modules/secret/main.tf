resource "opslevel_secret" "this" {
  alias = var.alias
  owner = var.owner
  value = var.value
}
