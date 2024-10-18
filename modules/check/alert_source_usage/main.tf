resource "opslevel_check_alert_source_usage" "this" {
  alert_name_predicate = var.alert_name_predicate
  alert_type           = var.alert_type

  # -- check base fields --
  category  = module.category.this
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  level     = module.level.this
  name      = var.name
  notes     = var.notes
  owner     = var.owner
}

module "category" {
  source          = "../../rubric_category/data"
  rubric_category = var.category
}

module "level" {
  source       = "../../rubric_level/data"
  rubric_level = var.level
}
