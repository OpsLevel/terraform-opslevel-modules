resource "opslevel_service_dependency" "this" {
  depends_upon = var.depends_upon
  note         = var.note
  service      = var.service
}
