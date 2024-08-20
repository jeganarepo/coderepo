##################
# ALB            #
##################
variable "alb_name" {
    description = "The name of the ALB"
    type        = string
    default     = ""
}


variable "alb_security_group" {
    description = "The Id of the security group for ALB"
    type        = list
    default     = []
}

variable "alb_subnets" {
    description = "The subnet id for ALB"
    type        = list
    default     = []
}

variable "alb_vpc_id" {
    description = "The id of the VPC"
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

variable "alb_target_port" {
    description = "The alb target port"
    type = string
    default = ""
  
}

variable "alb_target_portocol" {
    description = "The alb target protocol"
    type = string
    default = "HTTP"
}


variable "alb_ec2_instance_id" {
    description = "The id of the EC2 instance"
    type        = string
    default     = ""
}

variable "alb_ec2_target_port" {
    description = "The EC2 instance target port"
    type        = string
    default     = ""
}