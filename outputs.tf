output "vpc_id" {
  description = "vpc id"
  value       = module.vpc.vpc_id
}
output "public_subnet_ids" {
  description = "public subnet ids"
  value       = module.vpc.public_subnets
}
output "private_subnet_ids" {
  description = "private subnet ids"
  value       = module.vpc.private_subnets
}

