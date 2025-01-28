# main (root)

terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
}

module "web_server" {
  source            = "./modules/web_server"
  vpc_id            = var.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  web_sg_id         = var.web_sg_id
  key_name          = var.key_name

}