resource "aws_iam_role_policy_attachment" "attach-deploy-policy" {
  role = "${aws_iam_role.lambda-deploy-role.name}"
  policy_arn = "${aws_iam_policy.lambda-deploy-policy.arn}"
}

resource "aws_iam_policy" "lambda-deploy-policy" {

  name = "lambda_auto_deploy_policy"

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
      "Sid": "AccessAutoDeployLambda",
      "Action": [
        "lambda:GetFunction",
        "lambda:updateFunctionCode"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:lambda:*:*:*"
    },
    {
      "Sid": "AccessS3AutoDeployLambda",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "${module.lambda-deploy.bucket_arn}/*"
    }
   ]
}
EOF
}

resource "aws_iam_role" "lambda-deploy-role" {

  name = "lambda_auto_deploy"
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