provider "opslevel" {
}

module "john" {
  source = "../../modules/user"
  email  = "john@example.com"
  name   = "John Doe"
}

module "jane" {
  source = "../../modules/user"
  email  = "jane@example.com"
  name   = "Jane Doe"
}

module "doe" {
  source = "../../modules/user"
  email  = "doe@example.com"
  name   = "Doe Doe"
}

module "platform_team" {
  source = "../../modules/team"
  name   = "Platform"
  members = [
    { "email" : "john@example.com", "role" : "manager" },
    { "email" : "jane@example.com", "role" : "user" },
    { "email" : "doe@example.com", "role" : "contributor" },
  ]
}