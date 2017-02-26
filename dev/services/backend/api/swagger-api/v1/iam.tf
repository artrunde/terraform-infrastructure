resource "aws_iam_role_policy_attachment" "test_attach_policy" {
  role = "${aws_iam_role.test_role_lambda.name}"
  policy_arn = "${aws_iam_policy.test_policy_lambda.arn}"
}

resource "aws_iam_policy" "test_policy_lambda" {

  name = "test_policy_swagger"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AccessCloudwatchLogs",
      "Action": ["logs:*"],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    }
   ]
}
EOF
}

resource "aws_iam_role" "test_role_lambda" {

  name = "test_role_swagger_lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}