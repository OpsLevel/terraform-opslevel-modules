data "opslevel_systems" "all" {}

resource "opslevel_system" "this" {
  description = var.description
  domain      = var.domain
  name        = var.name
  note        = var.note
  owner       = local.owner
}

# TODO: This would be a really clean way to ensure service.parent is set via this module
#resource "opslevel_service_relationship" "this" {
#    for_each = { for service in var.services : service => service }
#    system  = opslevel_system.this.id
#    service = each.value
#}