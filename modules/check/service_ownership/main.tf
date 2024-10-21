resource "opslevel_check_service_ownership" "this" {
  contact_method         = var.contact_method
  require_contact_method = var.require_contact_method
  tag_key                = var.tag_key
  tag_predicate          = var.tag_predicate

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
