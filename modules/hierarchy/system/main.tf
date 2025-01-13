data "opslevel_systems" "all" {}

resource "opslevel_system" "this" {
  description = var.description
  domain      = var.domain
  name        = var.name
  note        = var.note
  owner       = local.owner
}

# resource "opslevel_service_relationship" "this" {
#  for_each = toset(var.services)
#
#  system  = opslevel_system.this.id
#  service = each.value
# }
