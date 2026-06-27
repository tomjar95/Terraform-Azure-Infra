locals {
  common_tags = {
    environment = var.environment
    owner       = var.owner
    managed_by  = "terraform"
  }


  resource_group_name = "exam-az900"
}

module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = local.resource_group_name
  location            = var.location
  tags                = local.common_tags
}