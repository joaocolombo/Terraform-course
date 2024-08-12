output "meu_storage_account_id" {
  description = "Id da storage account criada na AZ"
  value       = azurerm_storage_account.meu_storage_account.id
}

output "sa_primary_access_key" {
  description = "Primary access key da SA criada na AZ"
  value       = azurerm_storage_account.meu_storage_account.primary_access_key
  sensitive   = true
}