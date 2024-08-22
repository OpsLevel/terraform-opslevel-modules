provider "opslevel" {
}

module "platform_team" {
  source = "../../modules/team"
  name   = "Platform"
}