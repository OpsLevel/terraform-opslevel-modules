variable "account_token" {
  description = "The token for the account."
  type        = string
  sensitive   = true
}

variable "user_email" {
  description = "The email address of the user to invite to this demo account."
}
