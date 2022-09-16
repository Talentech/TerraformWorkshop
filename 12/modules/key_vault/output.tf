output "keyvault_uri" {
  value = azurerm_key_vault.keyvault.vault_uri
}

output "keyvault_secret_names" {
  value = module.key_vault_secrets.keyvault_secret_names
}
