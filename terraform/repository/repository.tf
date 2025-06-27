resource "aws_ecr_repository" "sample_repository" {
  name                 = "sample_repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}