output "all" {
  value = data.opslevel_domains.all
}

output "this" {
  value = opslevel_domain.this
}

#output "systems" {
#  value = module.systems[*].this
#}
