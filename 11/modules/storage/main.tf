
resource "azurerm_storage_account" "storage" {
  for_each                 = toset([for storage_account_with_tables in var.storage_accounts_with_tables : storage_account_with_tables.storage_account])
  name                     = each.key
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

module "storage_table" {
  source = "../storage_table"
  for_each = { for storage_account_with_tables in var.storage_accounts_with_tables
  : storage_account_with_tables.storage_account => storage_account_with_tables.tables }

  storage_account_name = each.key
  tables               = each.value
}
