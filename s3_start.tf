provider "aws" {
  region = "us-west-2"
}
module "ses_configuration_set" {
  source = "./modules"
}
