data "opslevel_rubric_levels" "all" {}

data "opslevel_rubric_level" "greatest_level_by_index" {
  filter {
    field = "index"
    value = max(data.opslevel_rubric_levels.all.rubric_levels[*].index...)
  }
}
