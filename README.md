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
