output "all" {
  value = data.opslevel_rubric_levels.all
}

output "greatest_level" {
  value = data.opslevel_rubric_level.greatest_level_by_index
}
