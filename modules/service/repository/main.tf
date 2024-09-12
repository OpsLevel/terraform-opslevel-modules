resource "opslevel_service_repository" "this" {
  base_directory   = var.base_directory
  name             = var.name
  repository       = var.repository
  repository_alias = var.repository_alias
  service_alias    = var.service_alias
  service          = var.service
}
