terraform {
  backend "s3" {
    bucket = var.state_s3_bucket
    key    = var.state_file_path
    region = var.aws_region
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.user_access_key
  secret_key = var.user_secret_key
}