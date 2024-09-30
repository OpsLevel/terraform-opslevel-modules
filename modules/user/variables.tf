variable "email" {
  type        = string
  description = "The email address of the user."
}

variable "name" {
  type        = string
  description = "The name of the user."
}

variable "role" {
  type        = string
  description = "The access role of the user."
  default     = "user"
}

variable "send_invite" {
  type        = bool
  description = "Choose whether to send an invite email even if notifications are disabled for the account."
  default     = true
}

variable "skip_welcome_email" {
  type        = bool
  description = "Don't send an email welcoming the user to OpsLevel."
  default     = true
}
