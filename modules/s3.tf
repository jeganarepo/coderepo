#tfsec:ignore:AWS077 Resource 's3 versioning' does not needed for this bucket 
module "log_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "~> 2.1"
  for_each   = {
    for value in var.libraries: value.s3_bucket_name => value
  }
  bucket     = "${each.value.s3_bucket_name}-${var.env}-${var.region}-log"
  acl           = "log-delivery-write"
  force_destroy = true # not sensitive objects

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = "arn"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = merge(
    {
      "Name"          = format("%s", "${each.value.s3_bucket_name}-${var.env}-${var.region}-log")
      #"ProvisionedBy" = format("%s", var.provisioned_by)
    },
    #var.tags
  )
}
