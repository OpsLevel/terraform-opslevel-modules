resource "opslevel_check_manual" "this" {
  category  = module.category.this
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  level     = module.level.this
  owner     = var.owner
  name      = var.name
  notes     = var.notes

  update_frequency        = var.update_frequency
  update_requires_comment = var.update_requires_comment
}

module "category" {
  source          = "../../rubric_category/data"
  rubric_category = var.category
}

module "level" {
  source       = "../../rubric_level/data"
  rubric_level = var.level
}
