provider "aws" {
  region = var.aws_region

  # Allow an offline Terraform plan for policy testing
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}