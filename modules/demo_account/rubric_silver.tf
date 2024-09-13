module "service_lifecycle_defined" {
  source = "../check/service_property"

  name     = "Lifecycle is Defined"
  category = opslevel_rubric_category.all["quality"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  property = "lifecycle_index"
}

module "has_splunk" {
  source = "../check/tool_usage"

  name     = "Splunk Integrated"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  tool_category = "logs"
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "has_datadog" {
  source = "../check/tool_usage"

  name     = "Datadog Integrated"
  category = opslevel_rubric_category.all["observability"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.internal-tools-team.this.id
  enabled  = true

  tool_category = "metrics"
  environment_predicate = {
    type  = "equals"
    value = "Production"
  }
}

module "has_pagerduty" {
  source = "../check/tool_usage"

  name     = "PagerDuty Integrated"
  category = opslevel_rubric_category.all["reliability"].id
  level    = opslevel_rubric_level.all["silver"].id
  owner    = module.internal-tools-team.this.id
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
  owner    = module.internal-tools-team.this.id
  enabled  = true

  tag_key = "build_speed"
  tag_predicate = {
    type  = "equals"
    value = "fast"
  }
}

# Log4J - Security
# No High vulns - security