provider "azurerm" {
  features {}

  subscription_id = "subscription ID"  # 🔁 Replace this with your actual Azure subscription ID
}

locals {
  timestamp = timestamp()
}

resource "azurerm_resource_group" "resume_rg" {
  name     = "resume-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "resume_storage" {
  name                     = "resumestorage${substr(md5(local.timestamp), 0, 8)}"
  resource_group_name      = azurerm_resource_group.resume_rg.name
  location                 = azurerm_resource_group.resume_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account_static_website" "resume_static" {
  storage_account_id = azurerm_storage_account.resume_storage.id

  index_document     = "index.html"
  error_404_document = "index.html"
}

output "primary_endpoint" {
  value = azurerm_storage_account.resume_storage.primary_web_endpoint
}

