variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "network_interface_name" {
  description = "Name of the NIC"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to connect the VM to"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
  default     = "azureuser"
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = map(string)
  default     = {}
}

variable "size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}