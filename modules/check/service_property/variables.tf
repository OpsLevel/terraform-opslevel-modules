variable "property" {
  type        = string
  description = "The property of the service that the check will verify."
}

variable "property_definition" {
  type        = string
  description = "The alias of the property that the check will verify (e.g. the specific custom property)."
  default     = null
}

variable "predicate" {
  type = object({
    type  = string
    value = optional(string)
  })
  description = "A condition that should be satisfied."
  default     = null
}
