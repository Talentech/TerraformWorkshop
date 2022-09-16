data "azurerm_storage_account" "storage" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_table" "table" {
  name                 = "bartekmtable"
  storage_account_name = data.azurerm_storage_account.storage.name
}

resource "azurerm_storage_table" "table1" {
  name                 = "bartekmtable1"
  storage_account_name = data.azurerm_storage_account.storage.name
}

resource "azurerm_storage_table" "table2" {
  name                 = "bartekmtable2"
  storage_account_name = data.azurerm_storage_account.storage.name
}


resource "azurerm_storage_table" "tables" {
  count = 3

  name                 = "bartekmt${count.index}"
  storage_account_name = data.azurerm_storage_account.storage.name
}
