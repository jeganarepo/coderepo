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

variable "outbound_rules" {
  description = "A list of outbound security group rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
##################
# ALB            #
##################
variable "alb_name" {
    description = "The name of the ALB"
    type        = string
    default     = ""
}

#####################
# ALB target group  #
#####################
variable "alb_target_group_name" {
    description = "The name of the alb target group"
    type        = string
    default     = ""  
}

variable "alb_ec2_target_port" {
    description = "The alb and ec2 target port"
    type = string
    default = ""
  
}

variable "alb_health_check" {
  description = "A map containing health check configuration parameters."
  type        = map(any)
  default     = {}
}
