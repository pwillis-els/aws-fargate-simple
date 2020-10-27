resource "aws_ecr_repository" "tfer--fargate-002D-container" {
  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = "true"
  }

  image_tag_mutability = "MUTABLE"
  name                 = "fargate-container"
}
