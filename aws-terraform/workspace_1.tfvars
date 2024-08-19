##############################
# AWS region                 #
##############################
region        = "us-east-1"

##############################
# VPC module defaults        #
##############################
resource_name = "workspace-1-demo"
vpc_cidr      = "10.16.0.0/16"

##############################
# EC2 module defaults        #
##############################
ami_id = "ami-04a81a99f5ec58529"
user_data_script_name = "jenkins_setup_ubuntu.sh"
####################################
# Security Group module defaults   #
####################################
security_group_name = "workspace-1-ec2-security-group"
inbound_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ]