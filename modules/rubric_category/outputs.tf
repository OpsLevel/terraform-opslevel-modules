output "all" {
  value = data.opslevel_rubric_categories.all
}

# TODO: is this used?
# output "requested" {
#   value = var.rubric_category == null ? null : startswith(var.rubric_category, "Z2lkOi8v") ? var.rubric_category : element([
#     for category in data.opslevel_rubric_categories.all.rubric_categories :
#     category.id if category.alias == var.rubric_category
#   ], 0)
# }

output "this" {
  value = opslevel_rubric_category.this
}
