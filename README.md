# About

This Terraform submodule will deploy a Fargate cluster, service, and related infrastructure. The goal is to "just deploy a damn container in Fargate."

The defaults are kept simple and you can override what you need.

# Usage

Create the file `main.tf`:
```hcl
provider "aws" {
  profile   = "my-aws-profile"
  region    = "us-east-1"
}

# main.tf
module "fargate-service-simple" {
  source            =   "git::ssh://git@github.com/pwillis-els/aws-fargate-simple.git?ref=1.0"

  aws_account_id    =   "1234567890"

  region            =   "us-east-1"
  vpc_id            =   "vpc-0000000000"
  subnet_ids        =   [ "subnet-00000000000", "subnet-0000000001" ]

  # specify the ECR container registry name to use (defaults to 'bastion-container:latest')
  ecr_container     =   "my-ecr-container-name:latest"

  # or instead, comment the above line and uncomment the following:
  #container_image   =   "docker.io/alpine:latest"

}
```

```bash
# Deploy the infrastructure
$ terraform plan
$ terraform apply

# If you decided to use the 'ecr_container' registry above, 
# Push your Docker container to the new ECR repository.
$ aws ecr get-login-password \
    --region $AWS_REGION \
    | docker login \
        --username AWS \
        --password-stdin \
        $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

$ docker tag \
    my-container:latest \
    $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/my-ecr-container-name:latest

# Wait a bit and the Fargate service will eventually pull the container and start a task.
# Check the Fargate service status and logs for errors.
```

