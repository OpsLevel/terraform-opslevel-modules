module "deploys" {
  source = "../integration/endpoint"

  name = "Deploys"
  type = "deploy"
}

module "terraform" {
  source = "../integration/endpoint"

  name = "Terraform Apply"
  type = "deploy"
}

module "rollbacks" {
  source = "../integration/endpoint"

  name = "Rollbacks"
  type = "deploy"
}