variable "alert_name_predicate" {
  type = object({
    type  = string
    value = optional(string)
  })
  description = "A condition that should be satisfied."
  default     = null
}

variable "alert_type" {
  type        = string
  description = "The type of the alert source."
}
