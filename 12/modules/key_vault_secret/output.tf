output "keyvault_secret_names" {
  value = [for s in azurerm_key_vault_secret.key_vault_secrets : s.name]
}
