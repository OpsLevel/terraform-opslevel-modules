locals {
  example_csv = [{
    "Aliases"      = "cart_ninja, ninja, shopping_cart",
    "Created"      = formatdate("MMM DD, YYYY", timestamp()),
    "Description"  = "Shopping cart management service",
    "Service Name" = "cart-ninja",
    "Team Owner"   = "Midnight Bandits",
    "Tier"         = "Tier 1",
    "Tools"        = "GitHub, PagerDuty, Datadog",
  }]
  csv_path = "${path.module}/services.csv"
  csv_data = fileexists(local.csv_path) ? csvdecode(file(local.csv_path)) : local.example_csv
  csv_services = [
    for service in local.csv_data : {
      for key, value in service :
      lower(replace(key, " ", "_")) => value
    }
  ]
  # NOTE: starter example for service tools
  datadog_svc_tool = {
    category    = "metrics"
    environment = "Production"
    name        = "Datadog"
    url         = "https://datadoghq.com"
  }
}

module "services_from_csv" {
  for_each = { for svc in local.csv_services : svc.service_name => svc }

  source      = "../service"
  name        = each.value.service_name
  aliases     = toset(split(",", each.value.aliases))
  description = each.value.description
  owner       = each.value.team_owner
  tier_alias  = each.value.tier
  tags        = ["db:mysql", "k8s:true", "build_speed:fast"]
  # NOTE: add to CSV file?
  # framework       = each.value.framework
  # language        = each.value.language
  # lifecycle_alias = each.value.lifecycle_alias
  tools = [
    for tool_name in split(",", each.value.tools) : lower(tool_name) == "datadog" ? local.datadog_svc_tool : {
      category    = "observability"
      environment = "Production"
      name        = tool_name
      url         = "https://example.com/example"
    }
  ]
  repositories = local.repository
  properties   = local.properties
}
