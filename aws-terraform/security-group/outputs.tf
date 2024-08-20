output "security_group_name" {
    value = aws_security_group.this.name
  
}

output "security_group_ids" {
    value = aws_security_group.this.id 
}

output "security_group_ingress" {
  value = aws_security_group.this.ingress
}