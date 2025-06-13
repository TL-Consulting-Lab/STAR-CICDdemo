terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # We will configure this later in the GitHub Actions workflow
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
