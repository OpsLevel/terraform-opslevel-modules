data "opslevel_teams" "all" {}

resource "opslevel_team" "test" {
  aliases          = var.aliases
  name             = var.name
  parent           = var.parent
  responsibilities = var.responsibilities
}