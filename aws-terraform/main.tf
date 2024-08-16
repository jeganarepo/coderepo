provider "aws" {
  region = var.region
}

module "vpc" {
  source        = "./vpc"
  vpc_cidr      = var.vpc_cidr
  resource_name = var.resource_name
}

module "security_group" {
  source              = "./security-group"
  security_group_name = var.security_group_name
  vpc_id              = module.vpc.vpc_id
  inbound_rules       = var.inbound_rules
}

module "ec2" {
  source    = "./ec2-instance"
  ami_id    = var.ami_id
  subnet_id = tolist(module.vpc.public_subnet_id)[0]
  vpc_security_group_ids = [module.security_group.security_group_ids]
}