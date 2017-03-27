# ------------------------------------------------------------------------------
# DALI API - LAMBDA
# ------------------------------------------------------------------------------

module "lambda_deployment_1" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../../terraform-modules/aws/lambda/"

  env             = "${var.terra_env}"
  name            = "${var.namespace}_php_lambda_proxy_${var.terra_env}_1"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.rodin_role_lambda.arn}"
  memory_size     = 1536

  # ------------------------------------------------------------------------------
  # CREATE EMPTY FUNCTION - Will use autodeploy later to update
  # ------------------------------------------------------------------------------
  create_dummy    = true

}

module "lambda_deployment_2" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../../terraform-modules/aws/lambda/"

  env             = "${var.terra_env}"
  name            = "${var.namespace}_php_lambda_proxy_${var.terra_env}_2"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.rodin_role_lambda.arn}"
  memory_size     = 1536

  # ------------------------------------------------------------------------------
  # CREATE EMPTY FUNCTION - Will use autodeploy later to update
  # ------------------------------------------------------------------------------
  create_dummy    = true

}
