# Security Group for Interface Endpoints
resource "aws_security_group" "vpc_endpoints" {
  name   = "${var.name_prefix}-vpc-endpoints-sg"
  vpc_id = data.aws_vpc.default_vpc.id

  ingress {
    protocol        = "tcp"
    from_port       = 443
    to_port         = 443
    security_groups = [aws_security_group.ecs_tasks.id] # Allow from ECS tasks
  }
}

# Interface Endpoints: ECR API, ECR Docker, and CloudWatch Logs
resource "aws_vpc_endpoint" "interface_endpoints" {
  for_each = toset(["ecr.api", "ecr.dkr", "logs"])

  vpc_id = data.aws_vpc.default_vpc.id
  # Dynamically uses the region from your provider
  service_name        = "com.amazonaws.${data.aws_region.current.name}.${each.key}"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_security_group.vpc_endpoints.id]

}

# S3 Gateway Endpoint (Required for ECR image layer downloads)
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = data.aws_vpc.default_vpc.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"

  # Attach to the route table used by your private subnets
  route_table_ids = [data.aws_route_table.default_vpc_rt.id]

}