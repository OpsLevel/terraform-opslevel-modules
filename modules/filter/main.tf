data "opslevel_filters" "all" {}

resource "opslevel_filter" "test" {
  name       = var.name
  connective = var.connective

  # Iterate over the list of predicates to create member blocks
  dynamic "predicate" {
    for_each = var.predicates
    content {
      key      = predicate.value.key
      key_data = predicate.value.key_data
      type     = predicate.value.type
      value    = predicate.value.value
    }
  }
}