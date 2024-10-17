resource "opslevel_scorecard" "this" {
  affects_overall_service_levels = var.affects_overall_service_levels
  description                    = var.description
  filter_id                      = var.filter_id
  name                           = var.name
  owner_id                       = var.owner_id
}
