provider "aws" {
  region = "sa-east-1"
}

resource "aws_iam_user" "myUser" {
  name = "terraform-user"
}

resource "aws_iam_policy" "customPolicy" {
  name = "s3AllowPolicy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
    EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name       = "attachment"
  users      = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}
