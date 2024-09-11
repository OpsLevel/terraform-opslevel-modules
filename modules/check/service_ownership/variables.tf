variable "contact_method" {
  type        = string
  description = "The type of contact method that is required."
  default     = null
}

variable "require_contact_method" {
  type        = bool
  description = "True if a service's owner must have a contact method, False otherwise."
  default     = null
}

variable "tag_key" {
  type        = string
  description = "The tag key where the tag predicate should be applied."
  default     = null
}

variable "tag_predicate" {
  type = object({
    type  = string
    value = optional(string)
  })
  description = "A condition that should be satisfied."
  default     = null
}
