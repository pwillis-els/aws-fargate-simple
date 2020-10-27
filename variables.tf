variable "security_groups" {
  description = "The security groups to apply to your Fargate service"
  type = list
  default = []
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy your Fargate service into"
  type = list
}

variable "vpc_id" {
  description = "The VPC ID to deploy security groups into"
}

variable "region" {
  description = "The AWS region"
}

variable "aws_account_id" {
  description = "The AWS account ID"
  type = string
}

variable "ecr_container" {
  description = "The name:tag of a container to deploy to ECR (that will be our fargate service)"
  default = "fargate-container:latest"
}

variable "container_image" {
  description = "Rather than specify just the var.ecr_container value, if you set this, this will be the full Docker image that Fargate will pull for your tasks. This defaults to an ECR URL that this module creates based on the var.ecr_container variable."
  default = ""
}

variable "container_port" {
  description = "The TCP port of the server listening on the Fargate container"
  type = number
  default = 443
}

variable "task_cpu" {
  description = "The number of CPU credits to assign to the Fargate task"
  default = "256"
}

variable "task_memory" {
  description = "The amount of memory to assign to the Fargate task"
  default = "512"
}

variable "sg_ingress_cidr" {
  description = "The CIDRs allowed to connect to the var.container_port of the Fargate task"
  default = [ "10.0.0.0/8" ]
}

variable "container_taskdef" {
  description = "The JSON task definition of the Fargate container to run"
  default = ""
}

variable "cluster_name" {
  description = "The name for the Fargate cluster"
  default = "fargate-cluster"
}

