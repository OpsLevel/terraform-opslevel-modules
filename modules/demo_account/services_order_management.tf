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
    local.tools.Datadog,
    local.tools.Datadog-Stg,
    local.tools.Splunk,
    local.tools.Sentry-Stg,
    local.tools.Runbooks,
    local.tools.PagerDuty,
    local.tools.Gremlin,
    local.tools.Gremlin-Stg,
    local.tools.Kubernetes,
    local.tools.Admin
  ]
  repositories = local.repositories
  properties   = local.properties
}

resource "terraform_data" "shopping-cart" {
  depends_on = [module.shopping-cart]

  provisioner "local-exec" {
    command = <<EOT
      curl -X POST -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPSLEVEL_API_TOKEN" \
      https://upload.opslevel.com/upload/documents/sbom/${module.shopping-cart.this.id} \
      -d '${local.sbom_good}'
EOT
  }
}

module "order-workflow" {
  source          = "../service"
  name            = "Order Workflow"
  description     = "Tracks the order workflow through all its stages post-creation."
  product         = "Order Pipeline"
  framework       = "Akka"
  language        = "Scala"
  lifecycle_alias = "beta"
  owner           = module.order-management-team.this.id
  tier_alias      = "tier_2"
  aliases         = ["order_workflow", "order-workflow", "orders"]
  tags            = ["db:postgres", "k8s:true", "kafka-topic:orders"]
  tools = [
    local.tools.Splunk,
    local.tools.PagerDuty,
  ]
  repositories = local.repository
  properties   = local.properties
}

module "order-fulfillment" {
  source          = "../service"
  name            = "Order Fulfillment"
  description     = "Fills the orders assigned by the order-workflow service to pass them onto picking-and-packing."
  product         = "Order Pipeline"
  framework       = "Akka"
  language        = "Scala"
  lifecycle_alias = "alpha"
  owner           = module.order-management-team.this.id
  tier_alias      = "tier_3"
  aliases         = ["order_fulfillment", "order-fulfillment", "fulfillment"]
  tags            = ["db:mysql", "k8s:true", "kafka-topic:orders"]
  tools = [
    local.tools.Admin,
    local.tools.Kubernetes,
    local.tools.Splunk,
    local.tools.Sentry,
  ]
  repositories = local.repository
  properties   = local.properties
}