output "subnet-id" {
  description = "Id da azurerm_subnet"
  value       = azurerm_subnet.subnet.id
}

output "security-group-id" {
  description = "Id da azurerm_network_security_group"
  value       = azurerm_network_security_group.security_group.id
}