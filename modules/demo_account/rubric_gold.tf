module "service_product_defined" {
  source = "../check/service_property"

  name     = "Product is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  property = "product"
}

module "service_system_defined" {
  source = "../check/service_property"

  name     = "System is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  property = "system"
}

module "has_runbooks" {
  source = "../check/tool_usage"

  name     = "Runbooks Defined"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  tool_category = "runbooks"
}

module "slos_defined" {
  source = "../check/manual"

  name     = "Has SLOs Defined"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = false
}

module "fast_deploys" {
  source = "../check/tag_defined"

  name     = "CD is Fast"
  category = opslevel_rubric_category.all["performance"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  tag_key = "deploy_speed"
  tag_predicate = {
    type  = "equals"
    value = "fast"
  }
}

module "has_deployed_this_sprint" {
  source = "../check/has_recent_deploy"

  name     = "Has Deployed this Sprint"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  days = 14
}

module "github_check_package_version" {
  source = "../check/package_version"

  name     = "Uses Latest Github Actions Checkout"
  category = opslevel_rubric_category.all["security"].id
  level    = opslevel_rubric_level.all["gold"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  package_constraint     = "matches_version"
  package_manager        = "github"
  package_name           = "actions/checkout"
  missing_package_result = "passed"
  version_constraint_predicate = {
    type  = "matches_regex"
    value = "^v5.*"
  }
}
