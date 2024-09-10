locals {
  people = {
    "John Doe" : "john@example.com"
    "Ken Doe" : "ken@example.com"
    "Adam Doe" : "admin@example.com"
    "Ian Doe" : "ian@example.com"
    "Toms Doe" : "toms@example.com"
    "Muriel Doe" : "muriel@example.com"
    "Ty Doe" : "ty@example.com"
    "Andrew Doe" : "andrew@example.com"
    "Stephanie Doe" : "stephanie@example.com"
    "Emily Doe" : "emily@example.com"
    "Kyle Doe" : "kyle@example.com"
    "David Doe" : "david@example.com"
  }
}

module "people" {
  for_each = local.people

  source = "../user"
  name   = each.key
  email  = each.value
}
