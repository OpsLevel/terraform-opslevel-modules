variable "name" {
  type        = string
  description = "The display name of the rubric category."
}

variable "rubric_category" {
  type        = string
  description = "The id or alias of the rubric category."
  default     = null
}
