locals {
    security_groups = length(var.security_groups) > 0 ? var.security_groups : [ aws_security_group.fargate_tasks.id ]

    cluster_name = "fargate-cluster"

    # Default to an ECR image
    container_image = length(var.container_image) > 0 ? var.container_image : "${var.aws_account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_container}"


    container_taskdef_default  = <<TASKDEF
[
    {
        "cpu": 0,
        "entryPoint": [],
        "essential": true,
        "image": "${local.container_image}",
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "${aws_cloudwatch_log_group.fargate_log_group.name}",
                "awslogs-region": "${var.region}",
                "awslogs-stream-prefix": "ecs"
            }
        },
        "name": "fargate-container",
        "portMappings": [
            {
                "containerPort": ${var.container_port},
                "hostPort": ${var.container_port},
                "protocol": "tcp"
            }
        ]
    }
]
TASKDEF

  container_taskdef = length(var.container_taskdef) > 0 ? var.container_taskdef : local.container_taskdef_default

}
