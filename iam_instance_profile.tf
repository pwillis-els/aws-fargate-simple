resource "aws_iam_instance_profile" "tfer--terraform-002D-20201021034834077700000001" {
  path = "/"
  role = aws_iam_role.tfer--fargate-002D-execution-002D-role.name
}
