################################
#   AWS EC2 Instance           #
################################
variable "ami_id" {
    description = "The id of the AMI"
    type        = string
    default     = ""
}

variable "instance_type" {
    description = "AWS instance type"
    type = string
    default = ""
}

variable "subnet_id" {
    description = "The id of the VPC subnet"
    type        = string
    default     = ""
  
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = "true"
}

variable "vpc_security_group_ids" {
    description = "A list of security group IDs to associate with"
    type        = list(string)
    default     = []
}


variable "user_data_script_name" {
  description = "The user data script name to provide when launching the instance"
  type        = string
  default     = ""
}

variable "ec2_ssh_pub_key_name" {
  description = "The ssh public key name"
  type = string
  default = "ec2-pub-key"
}

