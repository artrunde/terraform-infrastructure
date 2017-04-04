resource "aws_iam_role_policy_attachment" "attach_osman_policy" {
  role        = "${aws_iam_role.osman_lambda_deploy_role.name}"
  policy_arn  = "${aws_iam_policy.osman_lambda_deploy_policy.arn}"
}

resource "aws_iam_policy" "osman_lambda_deploy_policy" {

  name = "${var.namespace}_lambda_deploy_policy_${var.env}"

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
      "Resource": "${module.osman_lambda_deploy.bucket_arn}/*"
    }
   ]
}
EOF
}

resource "aws_iam_role" "osman_lambda_deploy_role" {

  name = "${var.namespace}_lambda_deploy_role_${var.env}"
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