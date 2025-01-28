# variables (root)

# vpc
variable "vpc_cidr" {
  type = string
}

variable "vpc_id" {
  type    = string
  default = "vpc_id"
}

variable "private_subnets_cidrs" {
  type = list(string)
}

variable "public_subnets_cidrs" {
  type = list(string)
}

# web server
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
}

variable "web_sg_id" {
  type = string
default = "web_sg_id"
}