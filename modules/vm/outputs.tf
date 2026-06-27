output "name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.name
}

output "id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.this.private_ip_address
}

output "admin_password" {
  description = "The randomly generated admin password for the virtual machine"
  value       = random_password.admin_password.result
}

output "network_interface_id" {
  description = "The ID of the network interface associated with the virtual machine"
  value       = azurerm_network_interface.this.id
}

output "network_interface_name" {
  description = "The name of the network interface associated with the virtual machine"
  value       = azurerm_network_interface.this.name
}