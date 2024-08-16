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
  default     = "demo"
}

variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
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
  default     = "demo"
}

variable "vpc_cidr" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
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

variable "vpc_id" {
    description = "value" = "The id of the VPC"
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