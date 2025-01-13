module "service_lifecycle_defined" {
  source = "../check/service_property"

  name     = "Lifecycle is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  property = "lifecycle_index"
}

module "has_splunk" {
  source = "../check/tool_usage"

  name     = "Has Logging Dashboard"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tool_category = "logs"
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "has_datadog" {
  source = "../check/tool_usage"

  name     = "Has Monitoring Dashboard"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tool_category = "metrics"
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "has_pagerduty" {
  source = "../check/tool_usage"

  name     = "Has Alerting/Paging System"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tool_category = "incidents"
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "fast_builds" {
  source = "../check/tag_defined"

  name     = "CI is Fast"
  category = opslevel_rubric_category.all["performance"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tag_key = "build_speed"
  tag_predicate = {
    type  = "equals"
    value = "fast"
  }
}

module "package_version_github_checkout" {
  source = "../check/package_version"

  name     = "Uses Latest GA Checkout"
  category = opslevel_rubric_category.all["security"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
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