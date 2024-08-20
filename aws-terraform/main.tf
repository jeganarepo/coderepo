
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
  outbound_rules      = var.outbound_rules
}

module "ec2" {
  source    = "./ec2-instance"
  ami_id    = var.ami_id
  subnet_id = tolist(module.vpc.public_subnet_id)[0]
  vpc_security_group_ids = [module.security_group.security_group_ids]
  user_data_script_name = var.user_data_script_name
}

module "alb" {
  source                = "./ALB"
  alb_name              = "${var.resource_name}-alb"
  alb_target_group_name = "${var.resource_name}-alb-tg"
  alb_security_group    = [module.security_group.security_group_ids]
  alb_subnets           = [module.vpc.public_subnet_id][0]
  alb_vpc_id            = module.vpc.vpc_id
  alb_ec2_instance_id   = module.ec2.ec2_instance_id
  alb_ec2_target_port   = var.alb_ec2_target_port
  alb_target_port       = var.alb_target_port
}
