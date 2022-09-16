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

  resource_group_name  = data.azurerm_resource_group.resource_group.name
  storage_account_name = "tt${local.name}st"
}
