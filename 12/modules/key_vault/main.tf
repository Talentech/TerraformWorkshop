data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                       = "${var.suffix}-keyvault"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "Delete",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]
  }
}

module "key_vault_secrets" {
  source       = "../key_vault_secret"
  key_vault_id = azurerm_key_vault.keyvault.id
  secrets      = var.secrets
}
