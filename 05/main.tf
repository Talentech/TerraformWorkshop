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

data "azurerm_storage_account" "storage" {
  name = "tt${local.name}st"
}
