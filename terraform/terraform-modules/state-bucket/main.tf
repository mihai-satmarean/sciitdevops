# main.tf
provider "aws" {
  region = "eu-central-1"
}

# Local backend for initial setup
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket        = "terraform-state-${terraform.workspace}"
  acl           = "private"
  force_destroy = true # For simplicity in training scenarios; remove in production.

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Terraform backend configuration post-initialization
output "backend_config" {
  value = <<EOT
  bucket = "${aws_s3_bucket.terraform_state_bucket.bucket}"
  key    = "state/${terraform.workspace}/terraform.tfstate"
  region = "${var.region}"
  EOT
}

variable "region" {
  default = "eu-central-1"
}
