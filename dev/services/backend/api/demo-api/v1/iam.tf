resource "aws_iam_role_policy_attachment" "test_attach_policy" {
  role = "${aws_iam_role.test_role_lambda.name}"
  policy_arn = "${aws_iam_policy.test_policy_lambda.arn}"
}


resource "aws_iam_policy" "test_policy_lambda" {

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
                  "dynamodb:UpdateItem",
                  "dynamodb:Scan"
                  ],
      "Resource": "${aws_dynamodb_table.basic_dynamodb_table.arn}"
    }
   ]
}
EOF
}

resource "aws_iam_role" "test_role_lambda" {

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