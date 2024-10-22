variable "constraint" {
  type        = string
  description = "The type of constraint used in evaluation the code issues check."
}

variable "issue_name" {
  type        = string
  description = "The issue name used for code issue lookup."
  default     = null
}

variable "issue_type" {
  type        = list(string)
  description = "The type of code issue to consider."
  default     = null
}

variable "max_allowed" {
  type        = number
  description = "The threshold count of code issues beyond which the check starts failing."
  default     = null
}

variable "resolution_time" {
  type = object({
    type  = string
    value = number
  })
  description = "The resolution time recommended by the reporting source of the code issue."
  default     = null
}

variable "severity" {
  type        = list(string)
  description = "The severity levels of the issue."
  default     = null
}
