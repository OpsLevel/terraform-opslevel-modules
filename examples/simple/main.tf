provider "opslevel" {
}

module "platform_team" {
  source = "../../modules/team"
  name   = "Platform"
}

module "filter" {
  source = "../../modules/filter"
  name   = "Platform Services"
  predicates = [
    {
      key    = "name"
      type   = "contains"
      value  = "Platform"
    },
    {
      key    = "tier_index"
      type   = "greater_than_or_equal_to"
      value  = "2"
    }
  ]
}