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

