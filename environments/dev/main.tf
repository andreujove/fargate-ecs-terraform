
module "ecr" {
  source   = "../../modules/ecr"
  
  
  name_prefix = var.name_prefix
  environment = var.environment
  image_mutability = var.image_mutability
}