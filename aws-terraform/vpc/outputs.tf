output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
 value = [ for k,v in aws_subnet.public_subnet : v.id]
}

output "private_subnet_id" {
  value = [ for k,v in aws_subnet.private_subnet : v.id]
}

output "internet_gw" {
  value = aws_internet_gateway.internet_gw.id
}