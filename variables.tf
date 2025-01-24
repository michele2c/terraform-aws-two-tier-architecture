# vpc
variable "vpc_cidr" {
  type        = string
}

variable "private_subnets_cidrs" {
  type        = list(string)
}

variable "public_subnets_cidrs" {
  type = list(string)
}