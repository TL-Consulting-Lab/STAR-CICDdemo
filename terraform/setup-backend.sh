#!/bin/zsh

# Script to set up Azure backend for Terraform state
# Variables
SUBSCRIPTION_ID="5c995f79-6f18-411a-9f9c-b620cae67a7e"
LOCATION="australiaeast"
BACKEND_RG_NAME="terraform-backend-rg"
STORAGE_ACCOUNT_NAME="tfstate$(openssl rand -hex 4)"
CONTAINER_NAME="tfstate"

# Set the correct subscription
echo "Setting Azure subscription..."
az account set --subscription $SUBSCRIPTION_ID

# Create resource group
echo "Creating resource group..."
az group create --name $BACKEND_RG_NAME \
    --location $LOCATION

# Create storage account
echo "Creating storage account..."
az storage account create \
    --resource-group $BACKEND_RG_NAME \
    --name $STORAGE_ACCOUNT_NAME \
    --sku Standard_LRS \
    --encryption-services blob \
    --min-tls-version TLS1_2 \
    --allow-blob-public-access false

# Get storage account key
echo "Getting storage account key..."
ACCOUNT_KEY=$(az storage account keys list \
    --resource-group $BACKEND_RG_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --query "[0].value" -o tsv)

# Create blob container
echo "Creating blob container..."
az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $ACCOUNT_KEY

# Output the configuration values
echo "\n=== Backend Configuration Values ==="
echo "These values need to be added as GitHub repository secrets:"
echo "TF_STATE_RESOURCE_GROUP_NAME: $BACKEND_RG_NAME"
echo "TF_STATE_STORAGE_ACCOUNT_NAME: $STORAGE_ACCOUNT_NAME"
echo "TF_STATE_CONTAINER_NAME: $CONTAINER_NAME"
