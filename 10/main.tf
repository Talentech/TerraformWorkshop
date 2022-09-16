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

locals {
  name = "bartekm"
}

data "azurerm_resource_group" "resource_group" {
  name = "talentech-${local.name}-rg"
}

module "storage" {
  source = "./modules/storage"

  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  storage_accounts_with_tables = [
    { storage_account = "tt${local.name}1st", tables = ["bartekm", "bartek2", "test"] },
    { storage_account = "tt${local.name}2nd", tables = ["bartekm", "bartek2", "test"] },
    { storage_account = "tt${local.name}3rd", tables = ["bartekm", "bartek2", "test"] }
  ]
}
