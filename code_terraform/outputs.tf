output "ec2_results" {
  value = data.aws_instance.ec2_instance.tags
}
