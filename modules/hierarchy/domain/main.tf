data "opslevel_domains" "all" {}

resource "opslevel_domain" "this" {
  name        = var.name
  description = var.description
  owner       = local.owner
  note        = var.note
}

module "systems" {
  source      = "../system"
  for_each    = { for system in var.systems : system.name => system }
  name        = each.value.name
  description = each.value.description
  domain      = opslevel_domain.this.id
  owner       = each.value.owner
  services    = each.value.services
}