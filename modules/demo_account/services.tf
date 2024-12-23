locals {
  csv_data = csvdecode(file("${path.module}/services.csv"))
  csv_services = [
    for service in local.csv_data : {
      for key, value in service :
      lower(replace(key, " ", "_")) => value
    }
  ]
}

module "services_from_csv" {
  depends_on = [module.teams_from_csv]
  for_each   = { for svc in local.csv_services : svc.service_name => svc }

  source          = "../service"
  name            = each.value.service_name
  aliases         = toset(split(",", each.value.aliases))
  description     = each.value.description
  framework       = each.value.framework
  language        = each.value.language
  lifecycle_alias = each.value.lifecycle
  owner           = module.teams_from_csv[each.key].this.id
  tier_alias      = each.value.tier
  tags            = ["db:mysql", "k8s:true", "build_speed:fast"]
  tools = [
    for index, tool_name in split(",", each.value.tools) : lookup(local.tools, tool_name, {
      name        = "Example-${index}",
      category    = "runbooks",
      environment = "Staging",
      url         = "https://example.com/example"
    })
  ]
  repositories = local.repository
  properties   = local.properties
}

module "teams_from_csv" {
  for_each = { for svc in local.csv_services : svc.service_name => svc }

  source = "../team"

  name   = each.value.team_owner
  parent = module.company-all.this.id
}

resource "terraform_data" "deploy_data" {
  for_each   = { for svc in local.csv_services : svc.service_name => svc if svc.deploys == "true" }
  depends_on = [module.deploys]

  provisioner "local-exec" {
    on_failure = continue
    command    = <<EOT
      ${path.module}/scripts/sample_deploys.sh deploys ${module.deploys.this.webhook_url} ${tolist(module.services_from_csv[each.key].this.aliases)[0]} ${local.unique_id}
EOT
  }
}

resource "terraform_data" "rollbacks_data" {
  for_each   = { for svc in local.csv_services : svc.service_name => svc if svc.deploys == "true" }
  depends_on = [module.rollbacks]

  provisioner "local-exec" {
    on_failure = continue
    command    = <<EOT
      ${path.module}/scripts/sample_deploys.sh rollbacks ${module.rollbacks.this.webhook_url} ${tolist(module.services_from_csv[each.key].this.aliases)[0]} ${local.unique_id}
EOT
  }
}

resource "terraform_data" "configuration_data" {
  for_each   = { for svc in local.csv_services : svc.service_name => svc if svc.deploys == "true" }
  depends_on = [module.terraform]

  provisioner "local-exec" {
    on_failure = continue
    command    = <<EOT
      ${path.module}/scripts/sample_deploys.sh terraform ${module.terraform.this.webhook_url} ${tolist(module.services_from_csv[each.key].this.aliases)[0]} ${local.unique_id}
EOT
  }
}