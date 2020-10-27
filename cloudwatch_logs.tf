# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "bastion_log_group" {
  name              = "/ecs/${var.cluster_name}"
  retention_in_days = 30

  tags = {
    Name = "bastion-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "bastion_log_stream" {
  name           = "bastion-log-stream"
  log_group_name = aws_cloudwatch_log_group.bastion_log_group.name
}
