resource "opslevel_filter" "python" {
  name = "Python Services"
  connective = "and"
  predicate {
    key   = "language"
    type  = "equals"
    value = "Python"
  }
}
