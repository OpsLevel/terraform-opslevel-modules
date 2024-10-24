resource "opslevel_check_package_version" "this" {
  category  = module.category.this
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  level     = module.level.this
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

module "category" {
  source          = "../../rubric_category/data"
  rubric_category = var.category
}

module "level" {
  source       = "../../rubric_level/data"
  rubric_level = var.level
}
