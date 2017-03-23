# ------------------------------------------------------------------------------
# DALI API - LAMBDA
# ------------------------------------------------------------------------------

module "lambda" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../../../terraform-modules/lambda/"

  env             = "${var.env}"
  name            = "${var.namespace}_php_lambda_proxy_${var.env}"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.rodin_role_lambda.arn}"
  memory_size     = 1536

  # ------------------------------------------------------------------------------
  # CREATE EMPTY FUNCTION - Will use autodeploy later to update
  # ------------------------------------------------------------------------------
  create_dummy    = true

}