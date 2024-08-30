output "all" {
  value = data.opslevel_services.all.services
}

output "this" {
  value = opslevel_service.this
}
