data "aws_availability_zones" "this" {}

locals {
  azs                 = slice(data.aws_availability_zones.this.names, 0, 2)
  public_subnet_cidr  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k * 2)]
  private_subnet_cidr = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k * 2 + 1)]
}

# VPC creation
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.resource_name}-vpc"
  }
}

# Public subnet creation
resource "aws_subnet" "public_subnet" {
  count             = length(local.public_subnet_cidr)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.public_subnet_cidr, count.index)
  availability_zone = element(local.azs,count.index)
  tags = {
    Name = "${var.resource_name}-public-subnet-${element(local.azs,count.index)}"
  }
}

# Private subnet creation
resource "aws_subnet" "private_subnet" {
    count             = length(local.private_subnet_cidr)
    vpc_id            = aws_vpc.this.id
    cidr_block        = element(local.private_subnet_cidr, count.index)
    availability_zone = element(local.azs,count.index)
    tags = {
        Name = "${var.resource_name}-private-subnet-${element(local.azs,count.index)}"
  }
}

# Internet gateway creation
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.resource_name}-internet-gw"
    
  }
}

# Public subnet route table and association
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
  tags = {
    Name = "${var.resource_name}-public-subnet-internet-route"
    
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  count          = length(local.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Private subnet route table and association
resource "aws_route_table" "private_route_table_association" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.resource_name}-private-subnet-route"
    
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  count          = length(local.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table_association.id
}