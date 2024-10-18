resource "opslevel_check_package_version" "this" {
  category  = local.rubric_category
  filter    = var.filter
  enable_on = var.enable_on
  enabled   = var.enabled
  level     = local.rubric_level
  name      = var.name
  notes     = var.notes
  owner     = var.owner

  missing_package_result       = var.missing_package_result
  package_constraint           = var.package_constraint
  package_manager              = var.package_manager
  package_name                 = var.package_name
  package_name_is_regex        = var.package_name_is_regex
  version_constraint_predicate = var.version_constraint_predicate
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
