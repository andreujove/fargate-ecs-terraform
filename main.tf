provider "aws" {
  profile = "tp-exam"
  region  = "eu-west-2"
}

terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_region" "current" {}

data "aws_iam_role" "task_ecs" {
  name = "ecsTaskExecutionRole"
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_availability_zones" "available" {
}

data "aws_route_table" "default_vpc_rt" {
  vpc_id = data.aws_vpc.default_vpc.id

  filter {
    name   = "association.main"
    values = ["true"]
  }
}
