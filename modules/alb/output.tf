output "alb_hostname" {
  description = "The fully qualified URL of the Load Balancer"
  value = "http://${aws_lb.main.dns_name}"
}