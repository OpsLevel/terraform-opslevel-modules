provider "opslevel" {
}

module "platform_team" {
  source = "../../modules/team"
  name   = "Platform"
}

module "check" {
  source   = "../../modules/check"
  type     = "manual"
  name     = "Is Metadata Updated?"
  category = "Quality"
  level    = "Bronze"
}
