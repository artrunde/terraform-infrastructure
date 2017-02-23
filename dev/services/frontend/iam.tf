resource "aws_iam_access_key" "circleci-frontend-key" {
  user    = "${aws_iam_user.circleci-frontend-user.name}"
}

resource "aws_iam_user" "circleci-frontend-user" {
  name = "circleci-frontend"
}

resource "aws_iam_user_policy" "circleci-frontend-policy" {

  name = "circleci-frontend-policy"
  user = "${aws_iam_user.circleci-frontend-user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CircleCIS3",
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${module.frontend-html.s3_bucket_id}/*",
        "arn:aws:s3:::${module.frontend-assets.s3_bucket_id}/*"
      ]
    }
  ]
}
EOF
}
