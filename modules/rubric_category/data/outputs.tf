output "all" {
  value = data.opslevel_rubric_categories.all
}

output "this" {
  value = local.requested_category
}

locals {
  requested_category = var.rubric_category == null ? null : startswith(var.rubric_category, "Z2lkOi8v") ? var.rubric_category : element([
    for category in data.opslevel_rubric_categories.all.rubric_categories :
    category.id if category.alias == var.rubric_category
  ], 0)
}

