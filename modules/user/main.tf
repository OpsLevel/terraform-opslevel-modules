resource "opslevel_user" "this" {
  email              = var.email
  name               = var.name
  role               = var.role
  send_invite        = var.send_invite
  skip_welcome_email = var.skip_welcome_email
}
