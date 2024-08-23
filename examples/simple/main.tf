provider "opslevel" {
}

module "platform_team" {
  source = "../../modules/team"
  name   = "Platform"
  members = [
    {"email": "john@example.com", "role": "manager"},
    {"email": "jane@example.com", "role": "user"},
    {"email": "doe@example.com",  "role": "contributor"},
  ]
}