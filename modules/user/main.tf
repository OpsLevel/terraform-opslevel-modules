data "opslevel_users" "all" {}

resource "opslevel_user" "this" {
  email              = var.email
  name               = var.name
  role               = var.role
  skip_welcome_email = var.skip_welcome_email
}
