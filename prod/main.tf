locals {
  common_tags = {
    environment = var.environment
    owner       = var.owner
    managed_by  = "terraform"
  }


  resource_group_name = "exam-az900"
  vnet_name           = "vnet-${local.resource_group_name}"
  vm1_name            = "az900-1"
  nic1_name           = "nic-az900-1"
  vm2_name            = "az900-2"
  nic2_name           = "nic-az900-2"
  vm_size             = "Standard_B1s"
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
  tags       = local.common_tags
  depends_on = [module.resource_group]
}

module "vm_az900_1" {
  source                 = "../modules/vm"
  vm_name                = local.vm1_name
  network_interface_name = local.nic1_name
  resource_group_name    = module.resource_group.name
  location               = var.location
  subnet_id              = module.vnet.subnet_ids["subnet0"]
  size                   = local.vm_size
  tags                   = local.common_tags
  depends_on             = [module.vnet]

}

module "vm_az900_2" {
  source                 = "../modules/vm"
  vm_name                = local.vm2_name
  network_interface_name = local.nic2_name
  resource_group_name    = module.resource_group.name
  location               = var.location
  subnet_id              = module.vnet.subnet_ids["subnet1"]
  size                   = local.vm_size
  tags                   = local.common_tags
  depends_on             = [module.vm_az900_1]
}