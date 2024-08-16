#############################
# Security Group            #
#############################

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "" 
}

variable "vpc_id" {
    description = "The id of the VPC"
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