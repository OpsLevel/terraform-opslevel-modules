data "opslevel_rubric_categories" "all" {}

data "opslevel_rubric_levels" "all" {}

locals {
  category = startswith(var.category, "Z2lkOi8v") ? var.category : flatten([
    for obj in data.opslevel_rubric_categories.all.rubric_categories :
    obj.id if obj.name == var.category
  ])[0]

  level = startswith(var.level, "Z2lkOi8v") ? var.level : flatten([
    for obj in data.opslevel_rubric_levels.all.rubric_levels :
    obj.id if obj.name == var.level
  ])[0]
}