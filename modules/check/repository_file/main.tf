resource "opslevel_check_repository_file" "this" {
  directory_search        = var.directory_search
  file_contents_predicate = var.file_contents_predicate
  filepaths               = var.filepaths
  use_absolute_root       = var.use_absolute_root

  # -- check base fields --
  category  = var.category
  enable_on = var.enable_on
  enabled   = var.enabled
  filter    = var.filter
  level     = var.level
  name      = var.name
  notes     = var.notes
  owner     = var.owner
}

