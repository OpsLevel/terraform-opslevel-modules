variable "missing_package_result" {
  type        = string
  description = "The check result if the package isn't being used by a service. (Optional.)"
  default     = null
}

variable "package_constraint" {
  type        = string
  description = "The package constraint the service is to be checked for. (Required.)"
}

variable "package_manager" {
  type        = string
  description = "The package manager (ecosystem) this package relates to. (Required.)"
}

variable "package_name" {
  type        = string
  description = "The name of the package to be checked. (Required.)"
}

variable "package_name_is_regex" {
  type        = string
  description = "Whether or not the value in the package name field is a regular expression. (Optional.)"
}

variable "version_constraint_predicate" {
  type = object({
    type  = string
    value = optional(string)
  })
  description = "A condition that should be satisfied."
}

resource "opslevel_check_package_version" "this" {
  count = var.check_type == "package_version" ? 1 : 0

  name     = var.name
  enabled  = var.enabled
  category = var.category
  filter   = var.filter
  level    = var.level
  owner    = var.owner
  notes    = var.notes

  package_constraint           = var.package_constraint
  package_manager              = var.package_manager
  package_name                 = var.package_name
  package_name_is_regex        = var.package_name_is_regex
  missing_package_result       = var.missing_package_result
  version_constraint_predicate = var.version_constraint_predicate
}

