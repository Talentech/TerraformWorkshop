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
  name          = "igor"
  secrets_count = 10
}

resource "azurerm_resource_group" "resource_group" {
  name     = "talentech-${local.name}-rg"
  location = "West Europe"
}

resource "random_password" "password" {
  count            = local.secrets_count
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "key_vault" {
  source              = "./modules/key_vault"
  suffix              = local.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  secrets = [
    for i in range(local.secrets_count) : {
      key   = "tt${local.name}-${i}"
      value = random_password.password[i].result
    }
  ]
}
