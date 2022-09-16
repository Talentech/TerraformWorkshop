terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.21.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "resource_group" {
  name = "talentech-bartekm-rg"
}

resource "azurerm_storage_account" "storage" {
  name                     = "ttbartekmst"
  resource_group_name      = data.azurerm_resource_group.resource_group.name
  location                 = data.azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "blob_txt_one_line" {
  name                   = "my-awesome-content.txt"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source_content         = "Test"
}

resource "azurerm_storage_blob" "blob_txt" {
  name                   = "my-awesome-content.txt"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source_content         = <<-EOT
  Test
  EOT
}

data "local_file" "my_xml" {
  filename = "./files/some.xml"
}

resource "azurerm_storage_blob" "blob_xml" {
  name                   = "my-awesome-content.xml"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source_content         = data.local_file.my_xml.content
}

output "blob_txt_url" {
  value = azurerm_storage_blob.blob_txt.url
}

output "blob_xml_url" {
  value = azurerm_storage_blob.blob_xml.url
}
