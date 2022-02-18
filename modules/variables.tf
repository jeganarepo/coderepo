variable "region" {
  description = "The resurce will be created in specified AWS region."
  type        = string
  default     = "us-west-2"
}

variable "env" {
  description = "Specify env for S3 bucket"
  type        = string
  default     = "test"
}
variable "libraries" {
  description = "List of objects needed to create vSphere content libraries"
  default = [
    { 
      s3_bucket_name         = "vsp1-content-prod"   
      ip_set_descriptor_cidr = ["10.0.0.0/8"]

    },
    {
      s3_bucket_name         = "vsp2-content-dev"
      ip_set_descriptor_cidr = ["172.31.16.0/20"]
    }
  ]
  type = list(object({
     s3_bucket_name  = string
     ip_set_descriptor_cidr = list(string)
  }))
}
