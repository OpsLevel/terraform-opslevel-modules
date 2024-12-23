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
            # module.order-workflow.this.id,
            # module.order-fulfillment.this.id
          ]
        },
        {
          name        = "Shopping Cart"
          description = "The system that manages the shopping cart."
          owner       = module.product-engineering-team.this.id
          services = [
            # module.shopping-cart.this.id
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
            # module.procurement-service.this.id
          ]
        },
        {
          name        = "Tooling"
          description = "Internal tools that help Big River Books employees."
          owner       = module.internal-tools-team.this.id
          services = [
            # module.certificate-manager.this.id,
            # module.employee-directory.this.id
          ]
        }
      ]
    }
  ]
}
