resource "aws_ecr_repository" "ecr_repository" {
  name                 = "${var.name_prefix}"
  image_tag_mutability = var.image_mutability
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

# resource "aws_ecr_lifecycle_policy" "main" {
#   repository = aws_ecr_repository.ecr_repository.name

#   policy = jsonencode({
#     rules = [
#       {
#         rulePriority = 1
#         description  = "Keep last 10 images"
#         selection = {
#           tagStatus     = "any"
#           countType     = "imageCountMoreThan"
#           countNumber   = 10
#         }
#         action = {
#           type = "expire"
#         }
#       }
#     ]
#   })
# }