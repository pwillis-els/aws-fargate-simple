resource "aws_ecs_cluster" "tfer--fargate-002D-cluster" {
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  name               = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
