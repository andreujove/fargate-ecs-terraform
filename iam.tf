# # ECS Execution Role (used by ECS itself to run your tasks)
# resource "aws_iam_role" "ecs_execution" {
#   name = "${var.name_prefix}-ecs-execution-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Action = "sts:AssumeRole",
#       Effect = "Allow",
#       Principal = {
#         Service = "ecs-tasks.amazonaws.com"
#       }
#     }]
#   })

#   tags = {
#     Name = "${var.name_prefix}-ecs-execution-role"
#   }
# }

# resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
#   role       = aws_iam_role.ecs_execution.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# Required?
# resource "aws_iam_role_policy" "ecs_execution_ecr_policy" {
#   name = "${var.name_prefix}-ecs-execution-ecr-policy"
#   role = aws_iam_role.ecs_execution.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "ecr-public:GetAuthorizationToken",
#           "ecr-public:BatchCheckLayerAvailability",
#           "ecr-public:GetDownloadUrlForLayer",
#           "ecr-public:BatchGetImage"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }


# # ECS Task Role (used by the app itself to access AWS resources)
# resource "aws_iam_role" "ecs_task_role" {
#   name = "${var.name_prefix}-ecs-task-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Action = "sts:AssumeRole",
#       Effect = "Allow",
#       Principal = {
#         Service = "ecs-tasks.amazonaws.com"
#       }
#     }]
#   })

#   tags = {
#     Name = "${var.name_prefix}-ecs-task-role"
#   }
# }
