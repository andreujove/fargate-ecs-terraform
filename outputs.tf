output "repository_url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}

output "repository_arn" {
  value = aws_ecr_repository.ecr_repository.arn
}

output "alb_hostname" {
  value = "http://${aws_lb.main.dns_name}"
}