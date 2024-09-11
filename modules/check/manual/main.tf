resource "opslevel_check_manual" "this" {
  name      = var.name
  category  = module.category.this
  level     = module.level.this
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  owner     = var.owner
  notes     = var.notes

  update_frequency        = var.update_frequency
  update_requires_comment = var.update_requires_comment

  lifecycle {
    ignore_changes = [
      enabled,
      enable_on
    ]
  }
}

module "category" {
  source          = "../../rubric_category"
  rubric_category = var.category
}

module "level" {
  source       = "../../rubric_level"
  rubric_level = var.level
}
