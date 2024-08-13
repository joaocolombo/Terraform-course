output "subnet_id" {
  description = "Id da subnet"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "Id da security group"
  value       = aws_security_group.security_group.id
}