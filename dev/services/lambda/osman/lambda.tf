# ------------------------------------------------------------------------------
# LAMBDA AUTO DEPLOY
# ------------------------------------------------------------------------------

module "osman_lambda_deploy" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../../terraform-modules/lambda-deploy/"

  env             = "${var.env}"
  name            = "${var.namespace}_lambda_deploy_${var.env}"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.osman_lambda_deploy_role.arn}"
  memory_size     = 1536
  bucket_name     = "${var.namespace}-s3-deploy-${var.env}"

}
