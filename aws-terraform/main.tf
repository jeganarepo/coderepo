provider "aws" {
  region = var.region
}

module "vpc" {
  source        = "./vpc"
  vpc_cidr      = var.vpc_cidr
  resource_name = var.resource_name
}
