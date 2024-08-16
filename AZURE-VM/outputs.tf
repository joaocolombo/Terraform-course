output "vm_ip" {
  description = "Ip da vm"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}