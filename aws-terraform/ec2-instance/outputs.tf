output "ec2_instance_id" {
  value = aws_instance.this.id
}

output "ec2_subnet_id" {
  value = aws_instance.this.subnet_id
}