locals {
  common_tags = {
    ManagedBy = "Terraform"
    Owner     = var.owner
    Env       = var.name
  }
}
