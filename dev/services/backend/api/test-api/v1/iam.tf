resource "aws_iam_role_policy_attachment" "test-attach-policy" {
  role = "${aws_iam_role.test-role-lambda.name}"
  policy_arn = "${aws_iam_policy.test-policy-lambda.arn}"
}

resource "aws_iam_policy" "test-policy-lambda" {

  name = "test_policy"

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
      "Sid": "SubscribersDynamoDBReadWrite",
      "Effect": "Allow",
      "Action": [
                  "dynamodb:DeleteItem",
                  "dynamodb:GetItem",
                  "dynamodb:PutItem",
                  "dynamodb:UpdateItem"
                  ],
      "Resource": "${aws_dynamodb_table.basic-dynamodb-table.arn}"
    }
   ]
}
EOF
}

resource "aws_iam_role" "test-role-lambda" {

  name = "test_role_lambda"
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