provider "opslevel" {}

module "account" {
  source = "../modules/demo_account"

  account_token     = var.account_token
  account_name      = "Big River Books"
  account_users     = [var.user_email]
  services_from_csv = local.csv_services
  #generate_services = 500  # Due note that due to API rate limits generating 500 services will take upwards of 10 mins and will significantly increase the time of future apply operations
}

locals {
  example_csv = [{
    "Aliases"      = "cart_ninja, ninja, shopping_cart",
    "Created"      = formatdate("MMM DD, YYYY", timestamp()),
    "Description"  = "Shopping cart management service",
    "Service Name" = "cart-ninja",
    "Team Owner"   = "Midnight Bandits",
    "Tier"         = "Tier 1",
    "Tools"        = "GitHub, PagerDuty, Datadog",
  }]
  csv_path = "${path.module}/services.csv"
  csv_data = fileexists(local.csv_path) ? csvdecode(file(local.csv_path)) : local.example_csv
  csv_services = [
    for service in local.csv_data : {
      for key, value in service :
      lower(replace(key, " ", "_")) => value
    }
  ]
}
