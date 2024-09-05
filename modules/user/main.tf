data "opslevel_users" "all" {}

resource "opslevel_user" "this" {
  email = var.email
  # force_send_invite  = var.force_send_invite  # TODO: uncomment on next release
  name               = var.name
  role               = var.role
  skip_welcome_email = var.skip_welcome_email
}
