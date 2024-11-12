provider "opslevel" {
}

module "account" {
  source = "../modules/demo_account"

  account_token = ""
  account_name  = "Demo Account"
  #generate_services = 500  # Due note that due to API rate limits generating 500 services will take upwards of 10 mins and will significantly increase the time of future apply operations
}