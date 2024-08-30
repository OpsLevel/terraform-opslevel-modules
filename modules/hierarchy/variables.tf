variable "domains" {
  type = list(object({
    name        = string
    description = optional(string)
    owner       = optional(string)
    systems = list(object({
      name        = string
      description = optional(string)
      owner       = optional(string)
      services    = list(string)
    }))
  }))
}