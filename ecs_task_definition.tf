resource "aws_ecs_task_definition" "tfer--task-002D-definition-002F-bastion-002D-test" {
  container_definitions    = local.container_taskdef

  cpu                      = var.task_cpu
  execution_role_arn       = aws_iam_role.tfer--bastion-002D-execution-002D-role.arn
  family                   = var.cluster_name
  memory                   = var.task_memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  # This isn't used by the task definition by default, but you can create a custom
  # task definition to use it & have a simple persistent volume in your container
  volume {
    name = "bastion-persist-volume"
  }
}

