resource "aws_ecr_repository" "this" {
  name = "${var.name}-repo"
  image_tag_mutability = "MUTABLE"
  tags = { Name = "${var.name}-ecr" }
}

