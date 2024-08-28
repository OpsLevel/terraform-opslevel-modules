module "domains" {
    source = "./domain"
    for_each = { for domain in var.domains : domain.name => domain }
    name        = each.value.name
    description = each.value.description
    owner       = each.value.owner
    systems     = each.value.systems
}
