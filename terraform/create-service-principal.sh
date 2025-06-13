#!/bin/zsh

# Script to create service principal for GitHub Actions
SUBSCRIPTION_ID="5c995f79-6f18-411a-9f9c-b620cae67a7e"

# Create service principal
echo "Creating service principal..."
SP_OUTPUT=$(az ad sp create-for-rbac \
    --name "github-actions-tf-backend" \
    --role="Contributor" \
    --scopes="/subscriptions/$SUBSCRIPTION_ID" \
    --json-auth)

# Get tenant ID
TENANT_ID=$(az account show --query tenantId -o tsv)

# Extract values from service principal output
CLIENT_ID=$(echo $SP_OUTPUT | jq -r .clientId)
CLIENT_SECRET=$(echo $SP_OUTPUT | jq -r .clientSecret)

# Output the values to be added as GitHub secrets
echo "\n=== GitHub Secrets Configuration ==="
echo "Add these values as secrets in your GitHub repository:"
echo "AZURE_SUBSCRIPTION_ID: $SUBSCRIPTION_ID"
echo "AZURE_TENANT_ID: $TENANT_ID"
echo "AZURE_CLIENT_ID: $CLIENT_ID"
echo "AZURE_CLIENT_SECRET: $CLIENT_SECRET"
