resource "opslevel_alias" "this" {
  resource_type        = var.resource_type
  resource_identifier  = var.resource_identifier
  aliases              = var.aliases
}
