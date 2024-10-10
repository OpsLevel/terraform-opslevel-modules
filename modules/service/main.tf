resource "opslevel_service" "this" {
  aliases                       = var.aliases
  api_document_path             = var.api_document_path
  description                   = var.description
  framework                     = var.framework
  language                      = var.language
  lifecycle_alias               = var.lifecycle_alias
  name                          = var.name
  note                          = var.note
  owner                         = var.owner
  preferred_api_document_source = var.preferred_api_document_source
  product                       = var.product
  tags                          = var.tags
  tier_alias                    = var.tier_alias
}

resource "opslevel_property_assignment" "this" {
  for_each = var.properties

  definition = each.key
  owner      = opslevel_service.this.id
  value      = each.value
}

module "service_repository" {
  source = "./repository"

  for_each = { for item in var.repositories : item.name => item }

  base_directory   = each.value.base_directory
  name             = each.value.name
  repository_alias = each.value.alias
  service          = opslevel_service.this.id
}

module "service_tool" {
  source = "./tool"

  for_each = { for item in var.tools : item.name => item }

  category    = each.value.category
  environment = each.value.environment
  name        = each.value.name
  service     = opslevel_service.this.id
  url         = each.value.url
}
