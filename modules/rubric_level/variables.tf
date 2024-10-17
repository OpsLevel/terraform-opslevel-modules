variable "description" {
  type        = string
  description = "The description of the rubric level."
  default     = null
}

variable "index" {
  type        = number
  description = "An integer allowing this level to be inserted between others. Must be unique per rubric."
  default     = null
}

variable "name" {
  type        = string
  description = "The display name of the rubric level."
}

variable "rubric_level" {
  type        = string
  description = "The id or alias of the rubric level."
  default     = null
}
