
module "ecr" {
  source   = "../../modules/ecr"
  
  
  name_prefix = var.name_prefix
  environment = var.environment
  image_mutability = var.image_mutability
}

data "aws_vpc" "default" {
  default = true
}

module "network" {
  source         = "../../modules/network"
  name_prefix    = var.name_prefix
  vpc_id         = data.aws_vpc.default.id
  vpc_cidr_block = data.aws_vpc.default.cidr_block
}

# # Example: Using the output for an ALB
# resource "aws_lb" "main" {
#   # ...
#   subnets = module.network.public_subnet_ids
# }