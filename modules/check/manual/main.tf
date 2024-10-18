resource "opslevel_check_manual" "this" {
  name      = var.name
  category  = local.rubric_category
  level     = local.rubric_level
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

locals {
  rubric_category = var.category == null ? null : startswith(var.category, "Z2lkOi8v") ? var.category : element([
    for category in data.opslevel_rubric_categories.all.rubric_categories :
    category.id if category.alias == var.category
  ], 0)
  rubric_level = var.level == null ? null : startswith(var.level, "Z2lkOi8v") ? var.level : element([
    for level in data.opslevel_rubric_levels.all.rubric_levels :
    level.id if level.alias == var.level
  ], 0)
}
