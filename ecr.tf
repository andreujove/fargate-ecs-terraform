resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.repository_name
  image_tag_mutability = var.image_mutability # Usually "MUTABLE" for dev, "IMMUTABLE" for prod

  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = var.repository_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
