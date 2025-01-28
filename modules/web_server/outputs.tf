output "web_server_ips" {
  value = aws_instance.web_server[*].public_ip
}

output "web_server_ids" {
  value = aws_instance.web_server[*].id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
