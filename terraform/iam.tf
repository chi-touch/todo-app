resource "aws_iam_user" "user" {
  name = var.iam_user_name
}

resource "aws_iam_policy" "s3_policy" {
  name = "todo-app-s3-access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "user_attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.s3_policy.arn
}
