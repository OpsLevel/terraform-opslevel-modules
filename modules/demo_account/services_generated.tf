module "ai-team" {
  source = "../team"
  name   = "AI Team"
  parent = module.dev-experience-group.this.id
  members = [
    {
      email = module.people["kyle"].this.email
      role  = "manager"
    },
  ]
}
