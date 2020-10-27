resource "aws_iam_policy" "tfer--bastion_ecr_get_policy" {
  description = "A policy to allow the bastion instance profile to pull ECR repositories"
  name        = "bastion_execution_policy"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"

      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ECSTaskExecutionRoleCustomPolicy"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--bastion_task_access" {
  description = "A policy to allow the bastion instance profile to pull ECR repositories"
  name        = "bastion_task_policy"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeAvailabilityZones"

      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "ECSTaskRoleCustomPolicy"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
