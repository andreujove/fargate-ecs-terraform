terraform {
  required_version = "~> 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Missing: Add a remote backend here (S3 + DynamoDB) 
}

provider "aws" {
  region  = "eu-west-2"
  profile = var.aws_profile # Use a variable instead of a hardcoded string

  default_tags {
    tags = {
      Project     = var.name_prefix
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "DevOps-Team"
    }
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# Existing IAM Role existing in the exam account: 
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
