# Resource Group - Main resource group for all Azure resources
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name  # Name of the resource group
  location = var.location            # Azure region where resources will be created

  tags = {
    Environment = var.environment    # Environment tag (dev, staging, prod)
    ManagedBy   = "Terraform"       # Indicates resource is managed by Terraform
  }
}

# Storage Account - For storing application data and backups
resource "azurerm_storage_account" "main" {
  name                     = lower(replace("${var.resource_group_name}storage", "-", ""))  # Create unique storage account name
  resource_group_name      = azurerm_resource_group.main.name  # Reference to resource group
  location                 = azurerm_resource_group.main.location  # Same location as resource group
  account_tier             = "Standard"  # Performance tier
  account_replication_type = "LRS"      # Locally redundant storage

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Virtual Machine - Linux VM for application hosting
resource "azurerm_linux_virtual_machine" "main" {
  name                = "${var.resource_group_name}-vm"  # VM name based on resource group
  resource_group_name = azurerm_resource_group.main.name # Resource group for VM
  location            = azurerm_resource_group.main.location # Same location as resource group
  size                = var.vm_size      # VM size/SKU
  admin_username      = var.admin_username # Administrator username
  admin_password      = var.admin_password # Administrator password
  network_interface_ids = [azurerm_network_interface.main.id] # NIC for network connectivity

  os_disk {
    caching              = "ReadWrite"  # Disk caching type
    storage_account_type = var.os_disk_type # OS disk storage performance tier
  }

  source_image_reference {
    publisher = var.os_publisher # OS image publisher
    offer     = var.os_offer    # OS image offer
    sku       = var.os_sku      # OS image SKU
    version   = var.os_version  # OS image version
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Virtual Network - Network infrastructure for VM and other resources
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name  # Name of the virtual network
  resource_group_name = azurerm_resource_group.main.name # Resource group for VNet
  location            = azurerm_resource_group.main.location # Same location as resource group
  address_space       = var.vnet_address_space # VNet IP address space

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Subnet - Internal subnet for VM and other resources
resource "azurerm_subnet" "internal" {
  name                 = var.subnet_name # Name of the subnet
  resource_group_name  = azurerm_resource_group.main.name # Resource group for subnet
  virtual_network_name = azurerm_virtual_network.main.name # Parent virtual network
  address_prefixes     = var.subnet_address_prefix # Subnet address range
}

# Network Interface - NIC for VM network connectivity
resource "azurerm_network_interface" "main" {
  name                = "${var.resource_group_name}-nic" # NIC name based on resource group
  resource_group_name = azurerm_resource_group.main.name # Resource group for NIC
  location            = azurerm_resource_group.main.location # Same location as resource group

  ip_configuration {
    name                          = "internal" # Name of IP configuration
    subnet_id                     = azurerm_subnet.internal.id # Reference to subnet
    private_ip_address_allocation = "Dynamic" # Dynamic IP allocation
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
