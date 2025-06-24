# Infrastructure Deployment Workflow

```mermaid
graph TD
    %% Developer Actions
    A[Developer] -->|1. Push Changes| B[GitHub Repository]
    
    %% GitHub Actions Workflow
    B -->|2. Trigger| C[GitHub Actions]
    
    %% Terraform Steps
    C -->|3. Initialize| D[Terraform Init]
    D -->|4. Plan| E[Terraform Plan]
    E -->|5. Apply| F[Terraform Apply]
    
    %% Azure Authentication
    C -->|Auth| G[Azure Service Principal]
    G -->|Credentials| H[Azure Subscription]
    
    %% Azure Resources
    F -->|6. Deploy| I[Azure Resources]
    
    subgraph Azure Resources
        I1[Resource Group] --> I2[Virtual Network]
        I2 --> I3[Subnet]
        I3 --> I4[Network Interface]
        I4 --> I5[Virtual Machine]
        I1 --> I6[Storage Account]
    end
    
    %% State Management
    F -->|7. Update| J[Terraform State]
    J -->|Store| K[Azure Storage Backend]
    
    %% Styling
    classDef azure fill:#0072C6,color:white
    classDef github fill:#24292E,color:white
    classDef terraform fill:#7B42BC,color:white
    
    class H,I,I1,I2,I3,I4,I5,I6,K azure
    class B,C github
    class D,E,F,J terraform
```

## Workflow Description

1. **Developer Initiates Changes**
   - Push code changes to GitHub repository
   - Changes can include Terraform configurations, variables, or outputs

2. **GitHub Actions Triggered**
   - Workflow automatically starts on push or pull request
   - Authenticates with Azure using Service Principal

3. **Terraform Initialize**
   - Sets up Terraform working directory
   - Downloads required providers
   - Configures backend storage

4. **Terraform Plan**
   - Creates an execution plan
   - Shows resource changes to be made
   - Validates configuration

5. **Terraform Apply**
   - Executes the planned changes
   - Creates/updates Azure resources
   - Updates state file

6. **Azure Resource Deployment**
   - Creates/updates Resource Group
   - Deploys Virtual Network infrastructure
   - Sets up Virtual Machine
   - Configures Storage Account

7. **State Management**
   - Updates Terraform state
   - Stores state in Azure Storage
   - Enables team collaboration

## Security Considerations

- Service Principal with minimal required permissions
- Secrets stored in GitHub Secrets
- State file stored in secure Azure Storage
- Network security rules for resources
