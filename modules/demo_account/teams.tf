module "company-all" {
  source = "../team"
  name   = "Company All"
}

module "executive-leadership-team" {
  source = "../team"
  name   = "ELT"
  parent = module.company-all.this.id
  members = [
    {
      email = module.people["john"].this.email
      role  = "manager"
    },
    {
      email = module.people["ken"].this.email
      role  = "contributor"
    },
  ]
}

module "product-engineering-team" {
  source = "../team"
  name   = "Product Engineering Team"
  parent = module.company-all.this.id
  members = [
    {
      email = module.people["john"].this.email
      role  = "manager"
    },
  ]
}

module "order-management-team" {
  source           = "../team"
  name             = "Order Management Team"
  responsibilities = "Responsible for managing the entire order workflow, including before they're placed (i.e. cart) all the way through to order fulfillment."
  parent           = module.product-engineering-team.this.id
  members = [
    {
      email = module.people["adam"].this.email
      role  = "manager"
    },
    {
      email = module.people["ian"].this.email
      role  = "contributor"
    },
    {
      email = module.people["muriel"].this.email
      role  = "contributor"
    },
  ]
}

module "inventory-team" {
  source           = "../team"
  name             = "Inventory Team"
  responsibilities = "Responsible for product procurement and catalog management and other things."
  parent           = module.product-engineering-team.this.id
  members = [
    {
      email = module.people["ty"].this.email
      role  = "contributor"
    },
    {
      email = module.people["andrew"].this.email
      role  = "contributor"
    }
  ]
}

module "warehouse-team" {
  source           = "../team"
  name             = "Warehouse Team"
  responsibilities = "Everything to do with warehouses!"
  parent           = module.product-engineering-team.this.id
  members = [
    {
      email = module.people["stephanie"].this.email
      role  = "manager"
    },
    {
      email = module.people["toms"].this.email
      role  = "contributor"
    }
  ]
}

module "dev-experience-group" {
  source           = "../team"
  name             = "Dev Experience Group"
  responsibilities = "This groups is responsible for the developer experience."
  parent           = module.product-engineering-team.this.id
  members = [
    {
      email = module.people["kyle"].this.email
      role  = "manager"
    },
    {
      email = module.people["david"].this.email
      role  = "contributor"
    }
  ]
}

module "internal-tools-team" {
  source           = "../team"
  name             = "Internal Tools Team"
  responsibilities = "This team is responsible for all of our internal tools and systems to help enable developer productivity."
  parent           = module.dev-experience-group.this.id
  members = [
    {
      email = module.people["ty"].this.email
      role  = "contributor"
    },
    {
      email = module.people["andrew"].this.email
      role  = "contributor"
    }
  ]
}