module "picking-and-packing" {
  source          = "../service"
  name            = "Picking and Packing"
  description     = "Routes pickers and packers in warehouses. Optimizes their path. "
  framework       = "Flask"
  language        = "Python"
  lifecycle_alias = "generally_available"
  owner           = module.warehouse-team.this.id
  tier_alias      = "tier_3"
  tags            = ["db:mysql", "k8s:true"]
  tools = [
    local.tools.Admin,
    local.tools.Sentry,
    local.tools.Gremlin,
    local.tools.Kubernetes,
    local.tools.Runbooks,
  ]
  repositories = local.repository
  properties   = local.properties
}

