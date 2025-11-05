output "key_vault_id" {
  value = azurerm_key_vault.this.id
}

output "key_vault_secret_id" {
  value = azurerm_key_vault_secret.this.id
}

output "key_vault_secret_value" {
  value = azurerm_key_vault_secret.this.value
}
