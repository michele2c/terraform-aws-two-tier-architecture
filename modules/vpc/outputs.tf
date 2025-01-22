output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}
output "private_subnets" {
  value = aws_subnet.private_subnets[*].id
}
output "web_sg_id" {
  value = aws_security_group.web_sg.id
}
output "db_sg_id" {
  value = aws_security_group.db_sg.id
}