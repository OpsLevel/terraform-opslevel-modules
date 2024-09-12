resource "opslevel_team" "this" {
  aliases          = var.aliases
  name             = var.name
  parent           = var.parent
  responsibilities = var.responsibilities

  # Iterate over the list of members to create member blocks
  dynamic "member" {
    for_each = var.members
    content {
      email = member.value.email
      role  = member.value.role
    }
  }
}

