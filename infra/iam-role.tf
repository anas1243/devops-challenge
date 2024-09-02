resource "aws_iam_role" "jenkins_iam_role" {
  name                = "Jenkins_iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.use_case}_iam_role"
  }
  managed_policy_arns = [aws_iam_policy.list_describe_ec2s.arn]
}

resource "aws_iam_policy" "list_describe_ec2s" {
  name = "list-describe-ec2s"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "jenkins_instance_profile"
  role = aws_iam_role.jenkins_iam_role.name
}