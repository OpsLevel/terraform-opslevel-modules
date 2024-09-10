module "shopping-cart" {
  source          = "../service"
  name            = "Shopping Cart"
  description     = "Allows users to add/remove products in their virtual shopping carts prior to placing an order."
  product         = "Retail Website"
  framework       = "Rails"
  language        = "Ruby"
  lifecycle_alias = "generally_available"
  owner           = module.order-management-team.this.id
  tier_alias      = "tier_1"
  aliases         = ["shopping_cart", "cart", "cart-service", "cart_service"]
  tags            = ["db:mysql", "k8s:true", "kafka-topic:cart-additions", "rails-version:5.2.6"]
  tools = [
    {
      name        = "Admin"
      category    = "admin"
      environment = "production"
      url         = "https://catalog.bigriverbooks.com/admin"
    },
    {
      name        = "PagerDuty",
      category    = "incidents",
      environment = "Production",
      url         = "https://opslevel.pagerduty.com/services/PHW94JT"
    },
    {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://opslevel.sentry.io/issues/?project=6108796"
    },
    {
      name        = "Gremlin",
      category    = "other",
      environment = "Staging",
      url         = "https://bigriverbooks.gremlin.com/catalog_service"
    },
    {
      name     = "Kubernetes",
      category = "orchestrator",
      url      = "https://deploy.bigriver.com/catalog"
    }
  ]
  repositories = [
    {
      name           = "Cart Monolith"
      base_directory = "src/monolith"
      alias          = "github.com:rocktavious/autopilot"
    },
    {
      name           = "Cart Service"
      base_directory = "src/service"
      alias          = "github.com:rocktavious/autopilot"
    }
  ]
  properties = {
    "my_custom_property" = jsonencode("helloworld")
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -X POST -H "Content-Type: application/json" \
      -H "Authorization: Bearer ${OPSLEVEL_API_TOKEN}" \
      https://upload.opslevel.com/upload/documents/sbom/${self.id} \
      -d ${local.sbom_good}
EOT
  }
}

module "order-workflow" {
  source          = "../service"
  name            = "Order Workflow"
  description     = "Tracks the order workflow through all its stages post-creation."
  product         = "Order Pipeline"
  framework       = "Scala"
  language        = "Akka"
  lifecycle_alias = "beta"
  owner           = module.order-management-team.this.id
  tier_alias      = "tier_2"
  aliases         = ["order_workflow", "order-workflow", "orders"]
  tags            = ["db:postgres", "k8s:true", "kafka-topic:orders"]
  tools = [
    {
      name        = "Admin"
      category    = "admin"
      environment = "production"
      url         = "https://catalog.bigriverbooks.com/admin"
    },
    {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://opslevel.sentry.io/issues/?project=6108796"
    },
    {
      name        = "Gremlin",
      category    = "other",
      environment = "Staging",
      url         = "https://bigriverbooks.gremlin.com/catalog_service"
    },
    {
      name     = "Kubernetes",
      category = "orchestrator",
      url      = "https://deploy.bigriver.com/catalog"
    }
  ]
  repositories = [
    {
      name  = "Codebase"
      alias = "github.com:rocktavious/autopilot"
    },
  ]
}

module "order-fulfillment" {
  source          = "../service"
  name            = "Order Fulfillment"
  description     = "Fills the orders assigned by the order-workflow service to pass them onto picking-and-packing."
  product         = "Order Pipeline"
  framework       = "Scala"
  language        = "Akka"
  lifecycle_alias = "alpha"
  owner           = module.order-management-team.this.id
  tier_alias      = "tier_3"
  aliases         = ["order_fulfillment", "order-fulfillment", "fulfillment"]
  tags            = ["db:mysql", "k8s:true", "kafka-topic:orders"]
  tools = [
    {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://opslevel.sentry.io/issues/?project=6108796"
    },
    {
      name        = "PagerDuty",
      category    = "incidents",
      environment = "Production",
      url         = "https://opslevel.pagerduty.com/services/PHW94JT"
    },
    {
      name        = "Gremlin",
      category    = "other",
      environment = "Staging",
      url         = "https://bigriverbooks.gremlin.com/catalog_service"
    },
    {
      name     = "Kubernetes",
      category = "orchestrator",
      url      = "https://deploy.bigriver.com/catalog"
    }
  ]
  repositories = [
    {
      name  = "Codebase"
      alias = "github.com:rocktavious/autopilot"
    },
  ]
}

module "procurement-service" {
  source          = "../service"
  name            = "Procurement Service"
  description     = "Manages inventory levels and procures for new inventory from vendors when levels are low."
  product         = "Procurement"
  framework       = "Django"
  language        = "Python"
  lifecycle_alias = "beta"
  owner           = module.inventory-team.this.id
  tier_alias      = "tier_4"
  aliases         = ["procurement_service", "procurement-service", "procurement"]
  tags            = ["db:mssql", "k8s:false"]
  tools = [
    {
      name        = "Admin"
      category    = "admin"
      environment = "production"
      url         = "https://catalog.bigriverbooks.com/admin"
    },
    {
      name        = "PagerDuty",
      category    = "incidents",
      environment = "Production",
      url         = "https://opslevel.pagerduty.com/services/PHW94JT"
    },
    {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://opslevel.sentry.io/issues/?project=6108796"
    },
    {
      name        = "Gremlin",
      category    = "other",
      environment = "Staging",
      url         = "https://bigriverbooks.gremlin.com/catalog_service"
    },
    {
      name     = "Kubernetes",
      category = "orchestrator",
      url      = "https://deploy.bigriver.com/catalog"
    }
  ]
  repositories = [
    {
      name  = "Codebase"
      alias = "github.com:rocktavious/autopilot"
    },
  ]
}

module "picking-and-packing" {
  source          = "../service"
  name            = "Picking and Packing"
  description     = "Routes pickers and packers in warehouses. Optimizes their path. "
  framework       = "Flask"
  language        = "Python"
  lifecycle_alias = "generally_available"
  owner           = module.warehouse-team.this.id
  tier_alias      = "tier_3"
  tags            = ["db:mysql", "k8s:true"]
  tools = [
    {
      name        = "Admin"
      category    = "admin"
      environment = "production"
      url         = "https://catalog.bigriverbooks.com/admin"
    },
    {
      name        = "PagerDuty",
      category    = "incidents",
      environment = "Production",
      url         = "https://opslevel.pagerduty.com/services/PHW94JT"
    },
    {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://opslevel.sentry.io/issues/?project=6108796"
    },
    {
      name        = "Gremlin",
      category    = "other",
      environment = "Staging",
      url         = "https://bigriverbooks.gremlin.com/catalog_service"
    },
    {
      name     = "Kubernetes",
      category = "orchestrator",
      url      = "https://deploy.bigriver.com/catalog"
    }
  ]
  repositories = [
    {
      name  = "Codebase"
      alias = "github.com:rocktavious/autopilot"
    },
  ]
}

module "certificate-manager" {
  source          = "../service"
  name            = "Certificate Manager"
  description     = "Shows a list of all outstanding TLS certificates deployed in our infrastructure, as well as their expiry dates."
  framework       = "Gin"
  language        = "Go"
  lifecycle_alias = "generally_available"
  owner           = module.internal-tools-team.this.id
  tier_alias      = "tier_3"
  tags            = ["k8s:true"]
  tools = [
    {
      name        = "Admin"
      category    = "admin"
      environment = "production"
      url         = "https://catalog.bigriverbooks.com/admin"
    },
    {
      name        = "PagerDuty",
      category    = "incidents",
      environment = "Production",
      url         = "https://opslevel.pagerduty.com/services/PHW94JT"
    },
    {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://opslevel.sentry.io/issues/?project=6108796"
    },
    {
      name        = "Gremlin",
      category    = "other",
      environment = "Staging",
      url         = "https://bigriverbooks.gremlin.com/catalog_service"
    },
    {
      name     = "Kubernetes",
      category = "orchestrator",
      url      = "https://deploy.bigriver.com/catalog"
    }
  ]
  repositories = [
    {
      name  = "Codebase"
      alias = "github.com:rocktavious/autopilot"
    },
  ]
}


module "employee-directory" {
  source      = "../service"
  name        = "Employee Directory"
  description = "Shows the names, faces, and phone extensions of all the happy employees here at Big River Books."
  framework   = "Phoenix"
  language    = "Elixer"
  owner       = module.internal-tools-team.this.id
  tier_alias  = "tier_4"
  aliases     = ["employee_directory", "internal_directory", "internal_employee_directory"]
  tags        = ["k8s:false", "opensource:true"]
  repositories = [
    {
      name  = "Codebase"
      alias = "github.com:rocktavious/autopilot"
    },
  ]
}