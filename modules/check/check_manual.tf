variable "update_frequency" {
  type = object({
    starting_date = string
    time_scale    = string
    value         = number
  })
  description = "Defines the minimum frequency of the updates."
}

variable "update_requires_comment" {
  type        = bool
  description = "Whether the check requires a comment or not."
}

resource "opslevel_check_manual" "manual" {
  count                   = var.type == "manual" ? 1 : 0

  name                    = var.name
  category                = var.category
  level                   = var.level
  enable_on               = var.enable_on
  enabled                 = var.enabled
  filter                  = var.filter
  owner                   = var.owner
  notes                   = var.notes

  update_frequency        = var.update_frequency
  update_requires_comment = var.update_requires_comment

  lifecycle {
    ignore_changes = [
      enabled,
      enable_on
    ]
  }
}