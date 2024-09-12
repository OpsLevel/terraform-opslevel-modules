resource "opslevel_check_has_recent_deploy" "test" {
  days = var.days

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
  source          = "../../rubric_category"
  rubric_category = var.category
}

module "level" {
  source       = "../../rubric_level"
  rubric_level = var.level
}
