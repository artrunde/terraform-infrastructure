# ------------------------------------------------------------------------------
# LAMBDA AUTO DEPLOY
# ------------------------------------------------------------------------------

module "osman_lambda_deploy" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../terraform-modules/aws/lambda-deploy/"

  env             = "${var.terra_env}"
  name            = "${var.namespace}_lambda_deploy_${random_id.random_name.hex}_${var.terra_env}"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.osman_lambda_deploy_role.arn}"
  memory_size     = 1536
  bucket_name     = "${var.namespace}-s3-deploy-${random_id.random_name.hex}-${var.terra_env}"
  account_id      = "${var.account_id}"
  s3_user         = "circleci_${var.namespace}"

}

resource "random_id" "random_name" {
  byte_length = 8
}
