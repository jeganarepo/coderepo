resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = templatefile("${path.module}/scripts/${var.user_data_script_name}",{})
  key_name                    = var.ec2_ssh_pub_key_name
}

resource "aws_key_pair" "privatestorage" {
  key_name   = var.ec2_ssh_pub_key_name
  public_key = file("${path.home}/.ssh/${var.ec2_ssh_pub_key_name}")
}
