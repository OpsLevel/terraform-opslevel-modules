resource "opslevel_check_service_configuration" "this" {
  category  = local.rubric_category
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  level     = local.rubric_level
  name      = var.name
  notes     = var.notes
  owner     = var.owner
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
