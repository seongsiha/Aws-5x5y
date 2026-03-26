resource "aws_eks_cluster" "this" {
  name     = "${var.project_name}-eks"
  role_arn = aws_iam_role.eks.arn

  version = "1.29"

  vpc_config {
    subnet_ids = aws_subnet.private[*].id
  }
}