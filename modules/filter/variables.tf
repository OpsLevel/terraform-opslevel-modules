variable "name" {
  type        = string
  description = "The filter's display name."
}

variable "connective" {
  type        = string
  description = "logical operator to be used in conjunction with multiple filters"
  default = "and"
}

variable "predicates" {
  type = list(object({
    case_sensitive = optional(bool)
    key            = string
    key_data       = optional(string)
    type           = string
    value          = optional(string)
  }))
  default = []
}