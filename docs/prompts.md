# Demo Prompts

## About This Project
This project demonstrates Infrastructure as Code (IaC) deployment to Azure using:
- Terraform for infrastructure definition
- GitHub Actions for CI/CD automation
- Azure Storage for Terraform state management
- Service Principal for secure authentication

Key Features:
- Automated infrastructure provisioning
- Secure backend configuration
- CI/CD pipeline setup
- Multi-environment support
- Best practices implementation

## Demo Walkthrough

### 1. Azure Authentication and Resource Management
# Connect to Azure
```
@azure connect to azure
-> az login
```

# List Resource Groups
```
@azure show Resource Groups
-> az group list --output table
```
# Show Running VMs
```
@azure Show Virtual machines status = running
-> az vm list --show-details --output table
```
### 2. Infrastructure Setup

# Create Resource Group
```
@azure Create Resource Group "Test-GH" location = australia southeast
```

### 3. Terraform Configuration Steps

1. **Provision Azure Infrastructure**
```
->  Provision Azure infrastructure (e.g., Resource Group, Storage Account) via GitHub Actions and Terraform.

->  Ensure that workflow files are at .github/workflows/ at the root of your repository.
   ```
2. **Variables Configuration**
```
->  /Create variables.tf and add the variables to variable.tf
   ``` 
3. **Backend Configuration**
```
->  Write a script to deploy azure backend resources and set subscription = "SubscriptionID" and location = "australiaeast"
   ```
4.**Modify the providers.tf**
```
->  Modify the backend configuration in providers.tf to use Azure AD authentication
```
4. **Run the backend script**
```
->  Set subscription = "SubscriptionID"
->  Set location = "australiaeast"
   ```
5. **Service Principal Setup**
```
->  Write a script to create service principal
->  Run the service principal creation script
   ```
### 4. Infrastructure Development

1. Auto Completion, 
```
Start by writing # Virtual Machine and when the ghost text appears, select TAB to accept to ESC  to reject
   ```
2. Use Agent Mode, 
```
Create Virtual Network (It probably will generate the dependency related resources like VNet, a subnet, and a network interface for your VM). If not ask Copilot!
   ```
3. Ask Mode, 
```
Do I need to make modifications to Virtual machine resource block with Network information? OR Explain how network interface id is generated?
   ```
### 5. Version Control and Deployment

1. **Initialize Git Repository**
   git init
   git add .
   git commit -m "Initial commit with Terraform configuration" OR ask Copilot to write  a commit message

2. **GitHub Integration**
   git remote add origin <your-github-repo-url>
   git push -u origin main

3. Test the GitHub Actions Workflow:
   git push

4. **Deploy Infrastructure**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
   
### 6. Documentation and Visualization

1. **Create Documentation**
   - Create documentation
   - Add inline comments
   - Create README.md

2. **Generate Diagrams**
   - Generate a visual workflow diagram with mermaid

3. How to open infrastructure diagram in mermaid and view the workflow(It will install the "Markdown Preview Mermaid Support" extension).

### 7. Cleanup

1. **Destroy Infrastructure**
   ```
   terraform destroy
   ```

2. **Clean Up Azure Resources**
   - Remove service principal
   - Delete backend storage
   - Delete resource groups
   - Clean up service principal
   - Remove backend storage

## Tips

1. **Using @azure Command**
   - The @azure prefix tells the AI to use Azure tools
   - Always use for Azure-related requests
   - Ensures best practices are followed

2. **Ghost Text Usage**
   - Press TAB to accept suggestions
   - Press ESC to reject
   - Useful for resource block creation

3. **Common Issues**
   - Check Azure login status if commands fail
   - Verify service principal permissions
   - Ensure backend storage is accessible

## Resource Links

- [Azure CLI Documentation](https://docs.microsoft.com/cli/azure)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Mermaid Diagram Syntax](https://mermaid-js.github.io/mermaid/#/)
