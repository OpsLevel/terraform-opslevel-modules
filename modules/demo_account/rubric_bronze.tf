module "service_owner_defined" {
  source = "../check/service_ownership"

  name     = "Owner is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true
}

module "service_repo_defined" {
  count  = var.git_repo == "" ? 0 : 1
  source = "../check/repository_integrated"

  name     = "Repository is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true
}

module "service_tier_defined" {
  source = "../check/service_property"

  name     = "Tier is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  property = "tier_index"
}

module "branch_protection" {
  count  = var.git_repo == "" ? 0 : 1
  source = "../check/git_branch_protection"

  name     = "Default Branch is Protected"
  category = opslevel_rubric_category.all["security"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true
}

module "has_sentry" {
  source = "../check/tool_usage"

  name     = "Has Error Tracking"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tool_category = "errors"
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "has_deployed_this_qtr" {
  source = "../check/has_recent_deploy"

  name     = "[UPCOMING] Has Deployed this Quarter"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = false

  days = 90
}

module "has_dependencies" {
  source = "../check/service_dependency"

  name     = "Has Defined Dependencies"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["bronze"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true
}

# No Critical Vulns - security