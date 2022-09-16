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
