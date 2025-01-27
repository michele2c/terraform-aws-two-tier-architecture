resource "aws_instance" "web_server" {
  count         = length(var.public_subnet_ids)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[count.index]
  key_name      = var.key_name

  security_groups = [
    var.web_sg_id
  ]

  tags = {
    Name = "web-server ${count.index + 1}"
  }
}
