output "aws_ecr_repository_tfer--bastion-002D-container_id" {
  value = "aws_ecr_repository.tfer--bastion-002D-container.id"
}
output "aws_ecs_cluster_tfer--bastion-002D-cluster_id" {
  value = "aws_ecs_cluster.tfer--bastion-002D-cluster.id"
}

output "aws_ecs_service_tfer--bastion-002D-cluster_bastion-002D-container-002D-latest_id" {
  value = "aws_ecs_service.tfer--bastion-002D-cluster_bastion-002D-container-002D-latest.id"
}

output "aws_ecs_task_definition_tfer--task-002D-definition-002F-bastion-002D-test_id" {
  value = "aws_ecs_task_definition.tfer--task-002D-definition-002F-bastion-002D-test.id"
}
output "aws_iam_policy_tfer--bastion_ecr_get_policy_id" {
  value = "aws_iam_policy.tfer--bastion_ecr_get_policy.id"
}

output "aws_iam_role_policy_attachment_tfer--bastion-002D-execution-002D-role_AmazonEC2RoleforSSM_id" {
  value = "aws_iam_role_policy_attachment.tfer--bastion-002D-execution-002D-role_AmazonEC2RoleforSSM.id"
}

output "aws_iam_role_policy_attachment_tfer--bastion-002D-execution-002D-role_CloudWatchAgentAdminPolicy_id" {
  value = "aws_iam_role_policy_attachment.tfer--bastion-002D-execution-002D-role_CloudWatchAgentAdminPolicy.id"
}

output "aws_iam_role_policy_attachment_tfer--bastion-002D-execution-002D-role_bastion_ecr_get_policy_id" {
  value = "aws_iam_role_policy_attachment.tfer--bastion-002D-execution-002D-role_bastion_ecr_get_policy.id"
}

output "aws_iam_role_tfer--bastion-002D-execution-002D-role_id" {
  value = "aws_iam_role.tfer--bastion-002D-execution-002D-role.id"
}

output "vpc_security_group_bastion_tasks" {
  value = aws_security_group.bastion_tasks.id
}
