variable "region" {
  description = "The resurce will be created in specified AWS region."
  type        = string
  default     = "us-west-2"
}

variable "env" {
  description = "Specify env for S3 bucket (i.e sharedsvs-prod/sharedsvs-non-prod)"
  type        = string
  default     = "playgroud"
}
variable "libraries" {
  description = "List of objects needed to create vSphere content libraries"
  default = [
    { 
      s3_bucket_name         = "vsphere-content-prod"   
      ip_set_descriptor_cidr = ["10.0.0.0/8"]

    },
    {
      s3_bucket_name         = "vsphere-content-dev"
      ip_set_descriptor_cidr = ["172.31.16.0/20"]
    }
  ]
  type = list(object({
    # Name used for naming resources for the content library (i.e. `s3_bucket_name`)
     s3_bucket_name  = string

    # List of CIDRs for IP allow lists (i.e. `ip_set_descriptor_cidr`)
    ip_set_descriptor_cidr = list(string)
  }))
}
