output "all_domains" {
  value = data.opslevel_domains.all.domains
}

output "all_systems" {
  value = data.opslevel_systems.all.systems
}

output "this" {
  value = values(module.domains)[*].this
}