resource "opslevel_check_has_documentation" "this" {
  document_type    = var.document_type
  document_subtype = var.document_subtype

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
