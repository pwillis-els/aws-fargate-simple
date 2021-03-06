resource "aws_iam_role_policy_attachment" "tfer--fargate-002D-execution-002D-role_fargate_ecr_get_policy" {
  policy_arn = aws_iam_policy.tfer--fargate_ecr_get_policy.arn
  role       = aws_iam_role.tfer--fargate-002D-execution-002D-role.name
}

#resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
#  role       = aws_iam_role.ecs_task_execution_role.name
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
#}


resource "aws_iam_role_policy_attachment" "tfer--fargate-002D-task-002D-role_fargate_task_access" {
  policy_arn = aws_iam_policy.tfer--fargate_ecr_get_policy.arn
  role       = aws_iam_role.tfer--fargate-002D-task-002D-role.name
}

