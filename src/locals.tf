locals {
  project = "terraform"
  web = "web"
  db = "database"
  vm_web = "${local.project}-${local.web}"
  vm_db = "${local.project}-${local.db}"
}