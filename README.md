# Azure Infrastructure with Terraform and GitHub Actions

This repository contains infrastructure as code (IaC) using Terraform to provision and manage Azure resources through GitHub Actions automation.

## Project Overview

This project provides:
- Automated Azure infrastructure deployment using Terraform
- CI/CD pipeline using GitHub Actions
- Secure state management with Azure Storage Backend
- Infrastructure components including resource groups and storage accounts
- Complete setup scripts for backend and service principal

## Prerequisites

### Required Tools
- Azure CLI
- Terraform
- Git
- jq (for JSON parsing)
- GitHub Account

### Azure Requirements
- Active Azure Subscription 
- Required Azure Permissions:
  - "User Access Administrator" or "Owner" role at subscription level
  - Permission to create Azure AD applications
  - Permission to assign roles
  - Permission to create resource groups and storage accounts
- Required Resource Providers:
  - Microsoft.Storage
  - Microsoft.Resources
  - Microsoft.Authorization

## Initial Setup

### Account Configuration
1. **GitHub Account Setup**
   ```bash
   # Configure Git with your credentials
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   
   # Generate and add SSH key (optional but recommended)
   ssh-keygen -t ed25519 -C "your.email@example.com"
   # Add the SSH key to your GitHub account through GitHub settings
   ```

2. **Azure Account Setup**
   ```bash
   # Install Azure CLI (if not already installed)
   
   # Login to Azure
   az login
   
   # Set your subscription
   az account set --subscription 
   ```

### Required Extensions and Tools Installation
1. **VS Code Extensions**
   - Install HashiCorp Terraform Extension
   - Install Azure Tools Extension Pack
   - Install GitHub Actions Extension

2. **Install Terraform**
   ```bash
   # Install hashicorp/tap/terraform
   
   # Verify installation
   terraform version
   ```

3. **Install jq**
   ```bash
   # Install jq
   
   # Verify installation
   jq --version
  

## Getting Started

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   ```

2. **Setup Steps**
   ```bash
   # Set up Azure Backend Storage
   ./setup-backend.sh

   # Create Service Principal
   ./create-service-principal.sh
   ```

## Repository Structure

```
terraform/
├── main.tf                      # Main Terraform configuration
├── variables.tf                 # Variable definitions
├── provider.tf                  # Azure provider configuration
├── terraform.tfvars            # Variable values
├── setup-backend.sh            # Backend setup script
├── create-service-principal.sh  # Service Principal creation script
└── README.md                   # This file
```

## Configuration

### GitHub Secrets Required
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT_ID`
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `TF_STATE_RESOURCE_GROUP_NAME`
- `TF_STATE_STORAGE_ACCOUNT_NAME`
- `TF_STATE_CONTAINER_NAME`

### Important Notes
- Backend setup script runs once only
- Service Principal creation script runs once only
- Never commit secrets to version control
- Always use GitHub secrets for sensitive values

## Workflow

1. **Infrastructure Changes**
   - Make changes to Terraform files
   - Commit and push to repository
   - GitHub Actions automatically:
     - Plans changes on PR
     - Applies changes on merge to main

2. **Manual Operations**
   ```bash
   # Initialize Terraform
   terraform init

   # Plan changes
   terraform plan

   # Apply changes
   terraform apply
   ```

## Security Features

- Secure backend state storage in Azure
- Service Principal with minimal required permissions
- All sensitive values stored in GitHub Secrets
- Resource tagging for management
- Storage account security features enabled

## Additional Resources

- [Detailed Setup Instructions](terraform/Demo_instructions.md)
- [Step-by-Step Guide](terraform/prompts.md)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## Troubleshooting

See [Demo_instructions.md](terraform/Demo_instructions.md) for detailed troubleshooting steps for:
- Service Principal issues
- Backend Storage problems
- GitHub Actions workflow failures

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details
