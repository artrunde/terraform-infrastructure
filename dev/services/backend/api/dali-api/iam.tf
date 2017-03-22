resource "aws_iam_role_policy_attachment" "dali_role_attach_policy" {
  role        = "${aws_iam_role.dali_role_lambda.name}"
  policy_arn  = "${aws_iam_policy.dali_policy_lambda.arn}"
}

resource "aws_iam_policy" "dali_policy_lambda" {

  name = "${var.namespace}_${var.env}_policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AccessCloudwatchLogs",
      "Action": ["logs:*"],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Sid": "DaliDevDynamoDBReadWrite",
      "Effect": "Allow",
      "Action": [
        "dynamodb:BatchGetItem",
        "dynamodb:Query",
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem",
        "dynamodb:Scan"
        ],
      "Resource": "arn:aws:dynamodb:${var.region}:${var.account_id}:table/dali_dev_*"
    }
   ]
}
EOF
}

resource "aws_iam_role" "dali_role_lambda" {

  name = "${var.namespace}_${var.env}_role_lambda"
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
