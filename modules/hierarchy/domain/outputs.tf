output "all" {
  value = data.opslevel_domains.all.domains
}

output "this" {
  value = opslevel_domain.this
}

output "systems" {
  value = values(module.systems)
}
