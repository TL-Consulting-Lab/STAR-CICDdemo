## GitHub Copilot Prompts for Project Enhancement

Use these prompts with GitHub Copilot to enhance and extend the project functionality. Try these prompts in your editor with Copilot enabled:

### Infrastructure Enhancements

1. **Add More Azure Resources**
   ```
   "Add an Azure Key Vault to store secrets in main.tf with these requirements:
   - Enable RBAC
   - Enable Soft Delete
   ```

2. **Enhance Security**
   ```
   "Add security layer in terraform validate stage"
   ```

3. **Improve Resource Organization**
   ```
   "Refactor the Terraform configuration to use modules for:
   - Resource group management
   - Storage account creation
   - Key vault configuration"
   ```

### Pipeline Improvements

1. **Enhanced GitHub Actions**
   ```
   "Add these features to terraform.yml workflow:
   - Environment protection rules
   - Manual approval for production
   - Security scanning"
   ```

2. **Testing Integration**
   ```
   "Add a workflow step to run terratest:
   - Test resource creation
   - Validate configurations
   - Check compliance rules"
   ```

3. **Deployment Stages**
   ```
   "Create a multi-environment deployment pipeline:
   - Dev/Test/Prod environments
   - Different variable sets per environment
   - Environment-specific approvals"
   ```

### Monitoring and Operations

1. **Azure Monitor Integration**
   ```
   "Add Azure Monitor configuration to main.tf:
   - Set up diagnostic settings
   - Configure log analytics workspace
   - Add monitoring metrics
   - Create alert rules"
   ```
   
### Documentation Improvements

1. **Documentation Generation**
   ```
   "Generate documentation using terraform-docs:
   - Module documentation
   - Input/output variables
   - Resource dependencies"
   ```

2. **Diagrams**
   ```
   "Create an infrastructure diagram using:
   - Terraform Graph
   - Draw.io integration
   - Show resource relationships"
   ```

### Cost Optimization

1. **Cost Analysis**
   ```
   "Add Terraform configurations for:
   - Resource tagging strategy
   - Budget alerts
   - Cost center allocation"
   ```

### Compliance and Security

1. **Policy Implementation**
   ```
   "Add Azure Policy configurations:
   - Enforce resource naming
   - Require specific tags
   - Implement compliance rules"
   ```

2. **Security Controls**
   ```
   "Implement security controls:
   - Enable encryption at rest
   - Configure key rotation
   - Set up RBAC roles"
   ```

### Best Practices for Using These Prompts

1. **Start Simple**
   - Begin with basic enhancements
   - Test each change thoroughly
   - Document modifications

2. **Iterative Development**
   - Implement one feature at a time
   - Commit changes frequently
   - Maintain backward compatibility

3. **Testing Strategy**
   - Test in development first
   - Use terraform plan to verify changes
   - Validate security configurations

4. **Documentation**
   - Update README.md with new features
   - Document any new variables
   - Keep architecture diagrams current

5. **Security Considerations**
   - Review access controls
   - Validate security configurations
   - Check for exposed secrets


