variable "generate_services" {
  description = "The number of services to generate."
  type        = number
  default     = 0
}

resource "random_pet" "services" {
  count = var.generate_services

  keepers = {
    # Generate a new pet names each time we switch the count
    count = var.generate_services
  }
}

module "ai-team" {
  source = "../team"
  name   = "AI Team"
  members = [
    {
      email = module.people["kyle"].this.email
      role  = "manager"
    },
  ]
}

# We had to use the resource directly here because the module does a query for all services per service generated which is SUPER heavy.
module "services_generated" {
  source = "../service"
  count  = var.generate_services

  name  = random_pet.services[count.index].id
  owner = module.ai-team.this.id
}