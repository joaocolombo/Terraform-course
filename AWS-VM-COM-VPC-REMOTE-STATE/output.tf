output "vm_ip" {
  description = "Ip da vm"
  value       = aws_instance.vm.public_ip
}