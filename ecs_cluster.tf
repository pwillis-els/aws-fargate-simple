resource "aws_ecs_cluster" "tfer--bastion-002D-cluster" {
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  name               = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
