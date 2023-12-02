terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.25.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

# -------------------------------------------------------------------- S3 backend
module "project_backend" {
  source = "github.com/LitvakIgor74/tfm-backend-s3?ref=v0.0.2"
  unique_prefix = "tci"
  project_name = "tproject1"
}
