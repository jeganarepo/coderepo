#####################
# AWS Region        #         
#####################
variable "region" {
  description = "AWS resource region"
  type        = string
  default     = ""
}

#####################
# VPC               #  
#####################

variable "resource_name" {
  type        = string
  description = "AWS resource name prefix"
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
  default     = ""
}

################################
#   AWS EC2 Instance           #
################################
variable "ami_id" {
    description = "The id of the AMI"
    type        = string
    default     = ""
}

variable "subnet_id" {
    description = "The id of the VPC subnet"
    type        = string
    default     = ""
  
}

variable "vpc_security_group_ids" {
    description = "A list of security group IDs to associate with"
    type        = list(string)
    default     = ""
}


variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
  default     = ""
}

#############################
# Security Group            #
#############################

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "" 
}

variable "inbound_rules" {
  description = "The inbound security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}