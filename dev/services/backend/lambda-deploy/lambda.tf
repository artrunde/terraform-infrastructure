# ------------------------------------------------------------------------------
# LAMBDA AUTO DEPLOY
# ------------------------------------------------------------------------------

module "lambda_deploy" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../../terraform-modules/lambda-deploy/"

  env             = "dev"
  name            = "auto_deploy_with_s3"
  runtime         = "nodejs4.3"
  role            = "${aws_iam_role.lambda_deploy_role.arn}"
  memory_size     = 1536
  bucket_name     = "kalles-autodeploy-terraform.artrunde.com"

}
