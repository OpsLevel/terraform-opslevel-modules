data "opslevel_rubric_categories" "all" {}

resource "opslevel_rubric_category" "this" {
  name = var.name
}
