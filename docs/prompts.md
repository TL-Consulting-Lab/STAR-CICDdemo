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

Use these prompts to walk through the demo in a logical sequence.

@azure connect to azure
-> az login

When you use @azure it tells the AI to:
Always use Azure tools when handling Azure-related requests

@azure show Resource Groups
-> az group list --output table

@azure Show Virtual machines status = running
-> az vm list --show-details --output table


## CREATE using AGENT mode in AZURE

@azure Create Resource Group "Test-GH" location = australia southeast

### Setup
 

1. Provision Azure infrastructure (e.g., Resource Group, Storage Account) via GitHub    Actions and Terraform.

2. Add variables.tf and add the variables to variable.tf

3. Write a script to deploy azure backend resources and set subscription = "5c995f79-6f18-411a-9f9c-b620cae67a7e" and location = "australiaeast"

4. Run the backend script

4. Write a script to create service principal

5. Run the service principal creation script

6. Initialize Git Repository
>>   cd "/Users/vanshika/Documents/azure CI:CD pipeline"
>>   git init
>>   git add .
>>   git commit -m "Initial commit with Terraform configuration"

7. Connect to GitHub Repository
>> git remote add origin <your-github-repo-url>
>> git push -u origin main

8. Test the GitHub Actions Workflow:
>> git push

9. Run terraform plan and apply

10. Create documentatiom

11. Create a workflow diagram

12. Destroy infrastructure
Clean up service principal
Remove backend storage

