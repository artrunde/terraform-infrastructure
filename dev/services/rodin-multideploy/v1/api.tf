# ------------------------------------------------------------------------------
# RODIN API - V1
# ------------------------------------------------------------------------------

module "green" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource"

  stage_name      = "green"

  terra_env       = "${var.terra_env}"
  namespace       = "${var.namespace}"
  region          = "${var.region}"
  account_id      = "${var.account_id}"
  role_lambda_arn = "${aws_iam_role.role_lambda.arn}"
  api_version     = "${var.api_version}"


}

module "blue" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource"

  stage_name      = "blue"

  terra_env       = "${var.terra_env}"
  namespace       = "${var.namespace}"
  region          = "${var.region}"
  account_id      = "${var.account_id}"
  role_lambda_arn = "${aws_iam_role.role_lambda.arn}"
  api_version     = "${var.api_version}"


}