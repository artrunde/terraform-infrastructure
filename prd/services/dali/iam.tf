resource "aws_iam_user_policy" "dali_circleci_policy" {

  name = "circleci_${var.namespace}_policy_${var.terra_env}"
  user = "${var.circleci_dali_user}"

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
        "arn:aws:s3:::${module.dali_html.s3_bucket_id}/*",
        "arn:aws:s3:::${module.dali_assets.s3_bucket_id}/*"
      ]
    }
  ]
}
EOF
}
