# ------------------------------------------------------------------------------
# TEST API - LAMBDA
# ------------------------------------------------------------------------------


module "lambda" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../../../../terraform-modules/lambda/"

  env             = "dev"
  name            = "simple-test-php"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.test_role_lambda.arn}"
  memory_size     = 1536

  # ------------------------------------------------------------------------------
  # CREATE EMPTY FUNCTION
  # ------------------------------------------------------------------------------
  create_dummy    = true

}