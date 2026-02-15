# fargate-ecs-terraform




### Login & push to ECR:

```bash
aws ecr get-login-password --region eu-west-2 --profile tp-exam | docker login --username AWS --password-stdin ************.dkr.ecr.eu-west-2.amazonaws.com
docker tag flask-hello:1.0.0 ************.dkr.ecr.eu-west-2.amazonaws.com/tp-flask-app:1.0.0
docker push ************.dkr.ecr.eu-west-2.amazonaws.com/tp-flask-app:1.0.0
```

