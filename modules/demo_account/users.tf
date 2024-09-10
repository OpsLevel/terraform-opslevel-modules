locals {
  people = {
    "john" : { name : "John doe", email : "john@example.com" }
    "ken" : { name : "Ken doe", email : "ken@example.com" }
    "adam" : { name : "Adam doe", email : "adam@example.com" }
    "ian" : { name : "Ian doe", email : "ian@example.com" }
    "toms" : { name : "Toms doe", email : "toms@example.com" }
    "muriel" : { name : "Muriel doe", email : "muriel@example.com" }
    "ty" : { name : "Ty doe", email : "ty@example.com" }
    "andrew" : { name : "Andrew doe", email : "andrew@example.com" }
    "stephanie" : { name : "Stephanie doe", email : "stephanie@example.com" }
    "emily" : { name : "Emily doe", email : "emily@example.com" }
    "kyle" : { name : "Kyle doe", email : "kyle@example.com" }
    "david" : { name : "David doe", email : "david@example.com" }
  }
}

module "people" {
  for_each = local.people

  source = "../user"
  name   = each.value.name
  email  = each.value.email
}
