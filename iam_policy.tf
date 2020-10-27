resource "aws_iam_policy" "tfer--fargate_ecr_get_policy" {
  description = "A policy to allow the fargate container to pull ECR repositories and create CloudWatch logs"
  name        = "fargate_execution_policy"
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

resource "aws_iam_policy" "tfer--fargate_task_access" {
  description = "A policy to allow the fargate task to perform AWS API actions at run time"
  name        = "fargate_task_policy"
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
