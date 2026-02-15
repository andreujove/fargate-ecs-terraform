# Fargate ECS with Terraform

This repository contains Terraform configurations for deploying a containerized Flask application on AWS ECS Fargate.

## 📋 Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/) installed and configured
- [Docker](https://www.docker.com/) installed
- [Terraform](https://www.terraform.io/downloads) installed (v1.0+)
- An AWS account with appropriate permissions

## 🚀 Getting Started

### 1. Configure AWS Profile

Create and configure an AWS profile for this project:

```bash
aws configure --profile tp-exam
export AWS_PROFILE=tp-exam
aws sts get-caller-identity --profile tp-exam
```

### 2. Login & push to ECR:
```bash
aws ecr get-login-password --region eu-west-2 --profile tp-exam | docker login --username AWS 
--password-stdin ************.dkr.ecr.eu-west-2.amazonaws.com
docker images
docker tag flask-hello:1.0.0 ************.dkr.ecr.eu-west-2.amazonaws.com/tp-flask-app:1.0.0
docker push ************.dkr.ecr.eu-west-2.amazonaws.com/tp-flask-app:1.0.0
```

### 3. Working with the repository:
```bash
terraform init
terraform plan -var-file="envs/dev.tfvars"
terraform apply -var-file="envs/dev.tfvars"
terraform destroy -var-file="envs/dev.tfvars"
```

#### Useful command:
```bash
terraform fmt
terraform validate
terraform show
terraform refresh
terraform output
```


References:
- https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html
- https://medium.com/@neamulkabiremon/build-a-production-grade-aws-ecs-fargate-cluster-with-terraform-modular-scalable-ci-cd-ready-07b0c5d40e6f
- https://alexhladun.medium.com/create-a-vpc-endpoint-for-ecr-with-terraform-and-save-nat-gateway-1bc254c1f42
- https://medium.com/@olayinkasamuel44/using-terraform-and-fargate-to-create-amazons-ecs-e3308c1b9166
- https://dev.to/aws-builders/deploying-a-simple-app-on-ecs-with-fargate-terraform-using-community-modules-e0b