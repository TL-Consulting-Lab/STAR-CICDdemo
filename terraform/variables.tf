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

# Virtual Machine Variables
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Administrator username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "os_disk_type" {
  description = "Storage account type for OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "os_publisher" {
  description = "Publisher for the VM image"
  type        = string
  default     = "Canonical"
}

variable "os_offer" {
  description = "Offer for the VM image"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "os_sku" {
  description = "SKU for the VM image"
  type        = string
  default     = "22_04-lts"
}

variable "os_version" {
  description = "Version of the VM image"
  type        = string
  default     = "latest"
}

# Virtual Network Variables
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "main-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "internal"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
