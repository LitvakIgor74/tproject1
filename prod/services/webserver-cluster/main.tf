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
    key = "prod/services/webserver-cluster/terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-2"
}


# ----------------------------------------------------------------------------------- data sources
data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    region = "us-east-2"
    bucket = "tci-tproject1-tfstates"
    key = "prod/data-stores/mysql/terraform.tfstate"
  }
}


# ----------------------------------------------------------------------------------- webserver-cluster
module "webserver_cluster" {
  source = "github.com/LitvakIgor74/tfm-service-webserver-cluster?ref=v0.0.1"
  unique_prefix = var.unique_prefix
  project_name = var.project_name
  instance_server_port = var.instance_server_port
  asg_min_size = var.asg_min_size
  asg_max_size = var.asg_max_size
  instance_type = var.instance_type
  db_port = data.terraform_remote_state.db.outputs.db_port
  db_address = data.terraform_remote_state.db.outputs.db_address
}

resource "aws_autoscaling_schedule" "scale_up" {
  scheduled_action_name = "${var.unique_prefix}-${var.project_name}-asg-scale-up"
  autoscaling_group_name = module.webserver_cluster.asg_name
  min_size = var.asg_min_size
  max_size = var.asg_max_size
  desired_capacity = var.asg_max_size
  recurrence = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_down" {
  scheduled_action_name = "${var.unique_prefix}-${var.project_name}-asg-scale-down"
  autoscaling_group_name = module.webserver_cluster.asg_name 
  min_size = var.asg_min_size
  max_size = var.asg_max_size
  desired_capacity = var.asg_min_size
  recurrence = "0 17 * * *"
}
