module "catalog-service" {
  source          = "../service"
  name            = "Catalog Service"
  description     = "Used to display information about what products are available for purchase and in what quantities."
  product         = ""
  framework       = "Akka"
  language        = "Scala"
  lifecycle_alias = "generally_available"
  owner           = module.inventory-team.this.id
  tier_alias      = "tier_1"
  aliases         = ["catalog_service", "catalog-service", "catalog"]
  tags            = ["db:cassandra", "db:mysql"]
  tools = [
    local.tools.Datadog,
    local.tools.Splunk,
    local.tools.Runbooks,
    local.tools.PagerDuty,
    local.tools.Gremlin,
    local.tools.Kubernetes,
    local.tools.Admin
  ]
  repositories = local.repository
  properties   = local.properties
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
    local.tools.Datadog,
    local.tools.Splunk,
    local.tools.PagerDuty,
  ]
  repositories = local.repositories
  properties   = local.properties
}

module "recommender-service" {
  source          = "../service"
  name            = "Recommender 2.0"
  description     = "Experimental recommendations engine that we use to A/B test new recommendations approaches with."
  product         = "Retail Website"
  framework       = ""
  language        = "Node.js"
  lifecycle_alias = "pre-alpha"
  owner           = module.inventory-team.this.id
  tier_alias      = "tier_4"
  aliases         = ["recommender_service", "recommender-service", "recommender"]
  tags            = []
  tools = [
  ]
  repositories = local.repositories
  properties   = local.properties
}

module "product-image-service" {
  source          = "../service"
  name            = "Product Image Service"
  description     = "Serverless service that hosts all images for our complete inventory of products."
  product         = "Retail Website"
  framework       = ""
  language        = "Python"
  lifecycle_alias = "generally_available"
  owner           = module.inventory-team.this.id
  tier_alias      = "tier_2"
  aliases         = ["product_image_service", "product-image-service", "product-image"]
  tags            = ["storage:s3"]
  tools = [
    local.tools.Datadog,
    local.tools.Splunk,
    local.tools.Kubernetes,
    local.tools.Sentry,
  ]
  repositories = local.repositories
  properties   = local.properties
}
