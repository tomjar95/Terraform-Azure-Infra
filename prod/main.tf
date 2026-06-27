locals {
  common_tags = {
    environment = var.environment
    owner       = var.owner
    managed_by  = "terraform"
  }


  resource_group_name = "exam-az900"
  vnet_name           = "vnet-${local.resource_group_name}"
}

module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = local.resource_group_name
  location            = var.location
  tags                = local.common_tags
}


module "vnet" {
  source              = "../modules/vnet"
  vnet_name           = local.vnet_name
  resource_group_name = module.resource_group.name
  location            = var.location
  address_space       = ["10.40.0.0/20"]
  subnet_config = {
    "subnet0" = {
      address_prefixes = ["10.40.0.0/24"]
    }
    "subnet1" = {
      address_prefixes = ["10.40.1.0/24"]
    }
  }  
  tags = local.common_tags
  depends_on = [module.resource_group]
}