variable "category" {
  type        = string
  description = "The id of the category the check belongs to."
}

variable "level" {
  type        = string
  description = "The id of the level the check belongs to."
}

variable "name" {
  type        = string
  description = "The display name of the check."
}

variable "enable_on" {
  type        = string
  description = "The date when the check will be automatically enabled."
  default     = null
}

variable "enabled" {
  type        = bool
  description = "Whether the check is enabled or not.  Do not use this field in tandem with 'enable_on'."
  default     = null
}

variable "filter" {
  type        = string
  description = "The id of the filter of the check."
  default     = null
}

variable "notes" {
  type        = string
  description = "Additional information to display to the service owner about the check."
  default     = null
}

variable "owner" {
  type        = string
  description = "The id of the team that owns the check."
  default     = null
}
