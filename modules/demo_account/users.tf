locals {
  people = {
    "john" : { name : "John Doe", email : "john+${local.unique_id}@example.com" }
    "ken" : { name : "Ken Doe", email : "ken+${local.unique_id}@example.com" }
    "adam" : { name : "Adam Doe", email : "adam+${local.unique_id}@example.com" }
    "ian" : { name : "Ian Doe", email : "ian+${local.unique_id}@example.com" }
    "toms" : { name : "Toms Doe", email : "toms+${local.unique_id}@example.com" }
    "muriel" : { name : "Muriel Doe", email : "muriel+${local.unique_id}@example.com" }
    "ty" : { name : "Ty Doe", email : "ty+${local.unique_id}@example.com" }
    "andrew" : { name : "Andrew Doe", email : "andrew+${local.unique_id}@example.com" }
    "stephanie" : { name : "Stephanie Doe", email : "stephanie+${local.unique_id}@example.com" }
    "emily" : { name : "Emily Doe", email : "emily+${local.unique_id}@example.com" }
    "kyle" : { name : "Kyle Doe", email : "kyle+${local.unique_id}@example.com" }
    "david" : { name : "David Doe", email : "david+${local.unique_id}@example.com" }
  }
}

module "people" {
  for_each = local.people

  source = "../user"
  name   = each.value.name
  email  = each.value.email
}

resource "opslevel_user" "user" {
  for_each = { for user in var.account_users : trim(split("@", user)[0], "\"") => user }

  name  = each.value
  email = each.value
  role  = "admin"
}
