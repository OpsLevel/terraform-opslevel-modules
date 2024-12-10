module "from_csv" {
  for_each = { for svc in var.services_from_csv : svc.service_name => svc }

  source          = "../service"
  name            = each.value.service_name
  aliases         = toset([each.value.aliases])
  description     = each.value.description
  framework       = each.value.framework
  language        = each.value.language
  lifecycle_alias = each.value.lifecycle_alias
  owner           = each.value.team_owner
  tier_alias      = each.value.tier
  tags            = ["db:mysql", "k8s:true", "build_speed:fast"]
  # tools           = each.value.tools
  repositories = local.repository
  properties   = local.properties
}
