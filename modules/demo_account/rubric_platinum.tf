module "manual_approval" {
  source = "../check/manual"

  name     = "Have you done your homework?"
  notes    = "Approving this check you solemnly swear you have finished all your homework!"
  category = opslevel_rubric_category.all["misc"].id
  level    = opslevel_rubric_level.all["platinum"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true
}

module "has_gremlin" {
  source = "../check/tool_usage"

  name     = "Performs Choas Experiments"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["platinum"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tool_category = "other"
  tool_url_predicate = {
    type  = "contains"
    value = "gremlin.com"
  }
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "has_sentry_stg" {
  source = "../check/tool_usage"

  name     = "Has Error Tracking in Staging"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["platinum"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tool_category = "errors"
  environment_predicate = {
    type  = "equals"
    value = "Staging"
  }
}

module "mttr" {
  source = "../check/tag_defined"

  name     = "MTTR < 2 hours"
  category = opslevel_rubric_category.all["performance"].id
  level    = opslevel_rubric_level.all["platinum"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  tag_key = "mttr"
  tag_predicate = {
    type  = "equals"
    value = "2"
  }
}

module "check_package_version_codecov" {
  source = "../check/package_version"

  name     = "Uses Latest CodeCov"
  category = opslevel_rubric_category.all["security"].id
  level    = opslevel_rubric_level.all["platinum"].id
  owner    = module.teams_from_csv["Internal Tools"].this.id
  enabled  = true

  package_constraint     = "matches_version"
  package_manager        = "github"
  package_name           = "codecov/codecov-action"
  missing_package_result = "passed"
  version_constraint_predicate = {
    type  = "matches_regex"
    value = "^v4.*"
  }
}
