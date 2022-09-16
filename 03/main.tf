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
