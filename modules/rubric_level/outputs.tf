output "all" {
  value = data.opslevel_rubric_levels.all
}

# TODO: is this used?
# output "this" {
#   value = var.rubric_level == null ? null : startswith(var.rubric_level, "Z2lkOi8v") ? var.rubric_level : element([
#     for level in data.opslevel_rubric_levels.all.rubric_levels :
#     level.id if level.alias == var.rubric_level
#   ], 0)
# }

output "this" {
  value = opslevel_rubric_level.this
}
