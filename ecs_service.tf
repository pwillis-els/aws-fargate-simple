resource "aws_ecs_service" "tfer--fargate-002D-cluster_fargate-002D-container-002D-latest" {
  cluster = var.cluster_name
  depends_on = [ aws_iam_policy.tfer--fargate_ecr_get_policy , aws_ecs_service.tfer--fargate-002D-cluster_fargate-002D-container-002D-latest ]

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "1"
  enable_ecs_managed_tags            = "true"
  health_check_grace_period_seconds  = "0"
  launch_type                        = "FARGATE"
  name                               = "fargate-container-latest"

  network_configuration {
    assign_public_ip = "false"
    security_groups  = local.security_groups
    subnets          = var.subnet_ids
  }

  platform_version    = "LATEST"
  propagate_tags      = "SERVICE"
  scheduling_strategy = "REPLICA"
  task_definition     = aws_ecs_task_definition.tfer--task-002D-definition-002F-fargate-002D-test.id
}
