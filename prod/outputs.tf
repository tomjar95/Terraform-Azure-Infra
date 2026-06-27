output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = module.resource_group.location
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.resource_group.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.vnet.name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.vnet.id
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value       = module.vnet.subnet_ids
}

output "vm1_name" {
  description = "Name of the first virtual machine"
  value       = module.vm_az900_1.name
}

output "password_vm1" {
  description = "Password for the first virtual machine"
  value       = module.vm_az900_1.admin_password
  sensitive   = true
}

output "vm2_name" {
  description = "Name of the second virtual machine"
  value       = module.vm_az900_2.name
}

output "password_vm2" {
  description = "Password for the second virtual machine"
  value       = module.vm_az900_2.admin_password
  sensitive   = true
}
