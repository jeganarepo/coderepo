#output "s3_bucket_bucket_domain_name" {
#  description = "Bucket domain name in format: bucketname.s3.amazonaws.com"
#  value = tomap({
#    for k, val in module.vsphere_bucket : k => {
#        s3_bucket_bucket_domain_name = val.s3_bucket_bucket_domain_name
#    }
#  })         
#}
