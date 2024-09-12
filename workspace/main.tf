provider "opslevel" {
}

module "account" {
  source = "../modules/demo_account"

  account_name = "Rockman Enterprises"
  #generate_services = 500  # Due note that due to API rate limits generating 500 services will take upwards of 10 mins and will significantly increase the time of future apply operations
}