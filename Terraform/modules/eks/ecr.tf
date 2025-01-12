# Resource ECR Caleed ngnix-app for storing images
resource "aws_ecr_repository" "foo1" {
  name                 = "php-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  lifecycle {
    prevent_destroy = true
  }
}



