data "opslevel_rubric_levels" "all" {}

resource "opslevel_rubric_level" "this" {
  name        = var.name
  description = var.description
  index       = var.index
}
