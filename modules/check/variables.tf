locals {
  check_types = ["manual"]
}

variable "type" {
  type        = string
  description = "The type check to create."
  validation {
    condition = contains(local.check_types, var.type)
    error_message = format("expected type to be one of %v", local.check_types)
  }
}

variable "name" {
  type        = string
  description = "The display name of the check."
}

variable "category" {
  type        = string
  description = "The id of the category the check belongs to."
}

variable "level" {
  type        = string
  description = "The id of the level the check belongs to."
}

variable "enable_on" {
  type        = string
  description = "The date when the check will be automatically enabled."
  default     = null
}

variable "enabled" {
  type        = bool
  description = "Whether the check is enabled or not.  Do not use this field in tandem with 'enable_on'."
  default     = true
}

variable "filter" {
  type        = string
  description = "The id of the filter of the check."
  default     = null
}

variable "owner" {
  type        = string
  description = "The id of the team that owns the check."
  default     = null
}

variable "notes" {
  type        = string
  description = "Additional information to display to the service owner about the check."
  default     = null
}
