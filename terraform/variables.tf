variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "australiaeast"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "admin_password" {
  description = "Password for the Virtual Machine administrator account"
  type        = string
  sensitive   = true  # Marks this variable as sensitive to prevent it from showing in logs
}
