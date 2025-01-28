variable "public_subnet_ids" {
  description = "List of public subnet IDs where EC2 instances will be deployed."
  type        = list(string)
}

variable "web_sg_id" {
  description = "Security group ID to associate with the EC2 instances."
  type        = string
}

variable "key_name" {
  description = "SSH key pair name."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to deploy."
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}