resource "opslevel_check_manual" "this" {
  name      = var.name
  category  = var.category
  level     = var.level
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  owner     = var.owner
  notes     = var.notes

  update_frequency        = var.update_frequency
  update_requires_comment = var.update_requires_comment

  lifecycle {
    ignore_changes = [
      enabled,
      enable_on
    ]
  }
}

