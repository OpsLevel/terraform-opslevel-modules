locals {
  sbom_good = templatefile("${path.module}/sboms/good.json", { })
  sbom_good2 = templatefile("${path.module}/sboms/good2.json", { })
  sbom_minimal = templatefile("${path.module}/sboms/minimal.json", { })
}