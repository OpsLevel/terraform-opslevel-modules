resource "opslevel_team_contact" "this" {
  name  = var.name
  team  = var.team
  type  = var.type
  value = var.value
}
