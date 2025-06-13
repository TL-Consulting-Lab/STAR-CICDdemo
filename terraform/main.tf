# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                     = lower(replace("${var.resource_group_name}storage", "-", ""))
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Outputs
output "resource_group_id" {
  value = azurerm_resource_group.main.id
}

output "storage_account_id" {
  value = azurerm_storage_account.main.id
}
