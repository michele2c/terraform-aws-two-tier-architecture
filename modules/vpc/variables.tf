# modules/vpc/variables

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  #default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  #default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  #default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
