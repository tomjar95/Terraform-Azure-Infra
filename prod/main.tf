resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

locals {
  resource_suffix = random_string.suffix.result
  common_tags = {
    environment = var.environment
    owner       = var.owner
    managed_by  = "terraform"
  }


  resource_group_name = "rg-${var.project_name}-${var.environment}-${local.resource_suffix}"
}

module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = local.resource_group_name
  location            = var.location
  tags                = local.common_tags
}