module "product" {
  source = "../hierarchy"
  domains = [
    {
      name        = "Retail Website"
      description = "The main website for Big River Books."
      owner       = module.executive-leadership-team.this.id
      systems = [
        {
          name        = "Order Pipeline"
          description = "The system that manages the order workflow."
          owner       = module.product-engineering-team.this.id
          services = [
            module.services_from_csv["order-routing"].this.id,
            module.services_from_csv["order-fulfillment"].this.id
          ]
        },
        {
          name        = "Shopping Cart"
          description = "The system that manages the shopping cart."
          owner       = module.product-engineering-team.this.id
          services = [
            module.services_from_csv["shopping-cart"].this.id,
          ]
        }
      ]
    },
    {
      name        = "Internal Services"
      description = "Internal services that power the Big River Books company."
      owner       = module.inventory-team.this.id
      systems = [
        {
          name        = "Procurement"
          description = "The system that manages inventory procurement."
          owner       = module.inventory-team.this.id
          services = [
            module.services_from_csv["inventory-restock"].this.id,
            module.services_from_csv["inventory-sync"].this.id
          ]
        },
        {
          name        = "Tooling"
          description = "Internal tools that help Big River Books employees."
          owner       = module.internal-tools-team.this.id
          services = [
            module.services_from_csv["employee-directory"].this.id,
            module.services_from_csv["certificate-manager"].this.id,
          ]
        }
      ]
    }
  ]
}
