variable "resource_type" {
  type        = string
  description = "The id or human-friendly, unique identifier of the resource this alias belongs to."
}

variable "resource_identifier" {
  type        = string
  description = "The resource type that the alias applies to."
}

variable "aliases" {
  type        = set(string)
  description = "The unique set of aliases to ensure exist on the resource"
}