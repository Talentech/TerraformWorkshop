data "azurerm_storage_account" "storage" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_table" "table" {
  for_each = toset(var.tables)

  name                 = each.key
  storage_account_name = data.azurerm_storage_account.storage.name
}
