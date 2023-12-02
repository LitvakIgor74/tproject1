terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.25.0"
    }
  }
  backend "s3" {
    region = "us-east-2"
    dynamodb_table = "tci-tproject1-tflocks"
    bucket = "tci-tproject1-tfstates"
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-2"
}


# -------------------------------------------------------------------------- RDS mysql
resource "aws_db_instance" "db" {
  identifier_prefix = "${var.unique_prefix}-${var.project_name}-"
  instance_class = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  engine = "mysql"
  db_name = var.db_name
  username = var.db_username
  password = var.db_password
  skip_final_snapshot = true
}
