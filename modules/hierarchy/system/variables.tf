variable "name" {
  type        = string
  description = "The name for the system."
}

variable "description" {
  type        = string
  description = "The description for the system."
  default     = null
}

variable "domain" {
  type        = string
  description = "The parent domain this system is a child of."
  default     = null
}

variable "note" {
  type        = string
  description = "Additional information about the system."
  default     = null
}

variable "owner" {
  type        = string
  description = "The team that owns the system."
  default     = null
}

variable "services" {
  type = list(string)
  description = "The services that this system is responsible for."
  default = []
}

// TODO: This is us papering over the fact that we cannot use team alias for the owner field in system - https://github.com/OpsLevel/team-platform/issues/461
data "opslevel_teams" "all" {}

locals {
  owner = var.owner == null ? null : (startswith(var.owner, "Z2lkOi8v") ? var.owner : flatten([
    for obj in data.opslevel_teams.all.teams :
    obj.id if obj.alias == var.owner
  ])[0])
}