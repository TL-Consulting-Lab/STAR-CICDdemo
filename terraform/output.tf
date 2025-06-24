# Output values for Azure resources
# These outputs can be used by other Terraform configurations or external tools

output "resource_group_id" {
  description = "ID of the created resource group"  # Used for resource references
  value       = azurerm_resource_group.main.id
}

output "storage_account_id" {
  description = "ID of the created storage account"  # Used for storage access and configuration
  value       = azurerm_storage_account.main.id
}

output "virtual_network_id" {
  description = "ID of the created virtual network"  # Used for network configuration
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "ID of the created subnet"  # Used for network interface configuration
  value       = azurerm_subnet.internal.id
}

output "network_interface_id" {
  description = "ID of the created network interface"  # Used for VM network configuration
  value       = azurerm_network_interface.main.id
}
