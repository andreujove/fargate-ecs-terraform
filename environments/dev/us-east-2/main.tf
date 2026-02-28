data "aws_vpc" "default" {
  default = true
}

data "aws_route_table" "default_vpc_rt" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "association.main"
    values = ["true"]
  }
}

# Existing IAM Role existing in the exam account: 
data "aws_iam_role" "task_ecs" {
  name = "ecsTaskExecutionRole"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}



module "ecr" {
  source            = "../../../modules/ecr"
  name_prefix       = var.name_prefix
  environment       = var.environment
  image_mutability  = var.image_mutability
}

module "network" {
  source              = "../../../modules/network"
  name_prefix         = var.name_prefix
  vpc_id              = data.aws_vpc.default.id
  vpc_cidr_block      = data.aws_vpc.default.cidr_block
  default_vpc_rt_id   = data.aws_route_table.default_vpc_rt.id
  aws_region          = data.aws_region.current.name
}

# module "ecs" {
#   source                    = "../../../modules/ecs"
#   name_prefix               = var.name_prefix
#   app_port                  = var.app_port
#   aws_region                = data.aws_region.current
#   task_execution_iam_role   = data.aws_iam_role.task_ecs.arn
# }