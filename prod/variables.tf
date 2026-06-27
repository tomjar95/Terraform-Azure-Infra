variable "subscription_id" {
  description = "Azure subscription ID"
  type = string
}

variable "location" {
  description = "Azure region for the resource group"
  type = string
  default = "germanywestcentral"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type = string
  default = "prod"
}

variable "owner" {
  description = "Owner of the resources"
  type = string
}

variable "project_name" {
  description = "Name of the project"
  type = string
}