variable "affects_overall_service_levels" {
  type        = bool
  description = "Specifies whether the checks on this scorecard affect services' overall maturity level."
}

variable "description" {
  type        = string
  description = "The scorecard's description."
  default     = null
}

variable "filter_id" {
  type        = string
  description = "The scorecard's filter."
  default     = null
}

variable "name" {
  type        = string
  description = "The scorecard's name."
}

variable "owner_id" {
  type        = string
  description = "The scorecard's owner."
}

