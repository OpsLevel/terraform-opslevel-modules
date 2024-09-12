module "certificate-manager" {
  source          = "../service"
  name            = "Certificate Manager"
  description     = "Shows a list of all outstanding TLS certificates deployed in our infrastructure, as well as their expiry dates."
  framework       = "Gin"
  language        = "Go"
  lifecycle_alias = "generally_available"
  owner           = module.internal-tools-team.this.id
  tier_alias      = "tier_3"
  tags            = ["k8s:true"]
  tools = [
    local.tools.Admin,
    local.tools.Kubernetes,
    local.tools.Runbooks,
  ]
  repositories = local.repository
  properties   = local.properties
}


module "employee-directory" {
  source       = "../service"
  name         = "Employee Directory"
  description  = "Shows the names, faces, and phone extensions of all the happy employees here at Big River Books."
  framework    = "Phoenix"
  language     = "Elixer"
  owner        = module.internal-tools-team.this.id
  tier_alias   = "tier_4"
  aliases      = ["employee_directory", "internal_directory", "internal_employee_directory"]
  tags         = ["k8s:false", "opensource:true"]
  repositories = local.repository
  properties   = local.properties
}