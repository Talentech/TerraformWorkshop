resource "azurerm_key_vault_secret" "key_vault_secrets" {
  for_each     = { for secret in var.secrets : secret.key => secret.value }
  name         = each.key
  value        = each.value
  key_vault_id = var.key_vault_id
}
