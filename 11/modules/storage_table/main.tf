
resource "azurerm_storage_table" "table" {
  for_each = toset(var.tables)

  name                 = each.key
  storage_account_name = var.storage_account_name
}
