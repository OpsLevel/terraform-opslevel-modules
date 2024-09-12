provider "opslevel" {
}

module "account" {
  source = "../modules/demo_account"

  account_name = ""
}