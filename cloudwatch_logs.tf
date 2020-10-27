# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "fargate_log_group" {
  name              = "/ecs/${var.cluster_name}"
  retention_in_days = 30

  tags = {
    Name = "fargate-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "fargate_log_stream" {
  name           = "fargate-log-stream"
  log_group_name = aws_cloudwatch_log_group.fargate_log_group.name
}
