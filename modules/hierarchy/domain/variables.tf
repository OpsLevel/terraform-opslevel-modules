variable "name" {
  type        = string
  description = "The name of the domain."
}

variable "description" {
  type        = string
  description = "The description of the domain."
  default     = null
}

variable "owner" {
  type        = string
  description = "The team that owns the domain."
  default     = null
}

variable "note" {
  type        = string
  description = "Additional information about the domain."
  default     = null
}

variable "systems" {
  type        = list(object({
      name     = string
      description = optional(string)
      owner       = optional(string)
      services = list(string)
    }))
}

// TODO: This is us papering over the fact that we cannot use team alias for the owner field in domain - https://github.com/OpsLevel/team-platform/issues/461
data "opslevel_teams" "all" {}

locals {
  owner = startswith(var.owner, "Z2lkOi8v") ? var.owner : flatten([
    for obj in data.opslevel_teams.all.teams :
    obj.id if obj.alias == var.owner
  ])[0]
}