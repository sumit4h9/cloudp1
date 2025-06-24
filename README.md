# cloudp1
# 🌐 Azure Static Website Hosting using Terraform

This project demonstrates how to provision and deploy a static website on Azure Storage using **Terraform** as Infrastructure as Code (IaC). It automates the creation of resources like the resource group, storage account, and static website configuration.

## 📁 Project Structure

terraform/
├── main.tf # Terraform configuration file
├── terraform.tfstate # Terraform state file (auto-generated)
├── index.html # Sample website content
├── style.css # Stylesheet (optional)

## 🧱 Architecture

1. Terraform provisions:
   - Azure Resource Group
   - Azure Storage Account (with Static Website enabled)
2. Website files (`index.html`, `style.css`, etc.) are uploaded to the `$web` container.
3. Azure serves the website via the generated `primary_web_endpoint`.

## 🔧 Tools & Technologies

- [Azure Cloud](https://azure.microsoft.com/)
- [Terraform](https://www.terraform.io/)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- HTML/CSS
- Git & GitHub

## 🚀 Setup Instructions

1. **Creating resources**

```bash
cd azure-static-website-terraform/terraform
Login to Azure:

bash
az login
Initialize Terraform:

bash
terraform init
Apply Terraform Configuration:

bash
terraform apply
📌 This will provision all Azure resources and output a public web endpoint.

Upload Website Files to Azure Blob Storage:

bash
az storage blob upload-batch \
  --account-name <your_storage_account_name> \
  --source ../ \
  --destination '$web' \
  --sas-token "<your_generated_sas_token>"
Access Your Website:

Open the output primary_endpoint URL in your browser.

📎 Clean Up
To destroy all created resources:

bash
terraform destroy
📬 Author
Sumit Shelar
