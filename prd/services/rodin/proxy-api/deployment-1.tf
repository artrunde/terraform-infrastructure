# ------------------------------------------------------------------------------
# DALI APIs - API
# ------------------------------------------------------------------------------

resource "aws_api_gateway_rest_api" "rodin_proxy_public_api_1" {
  name = "${var.namespace}_${random_id.random_name_1.hex}_${var.terra_env}_1"
}

# ------------------------------------------------------------------------------
# RANDOM GENERATOR
# ------------------------------------------------------------------------------

resource "random_id" "random_name_1" {
  byte_length = 8
}


# ------------------------------------------------------------------------------
# DALI API - DEPLOYMENTS
# ------------------------------------------------------------------------------

resource "aws_api_gateway_deployment" "proxy_public_api_deployment_1" {

  depends_on  = ["module.rodin_http_proxy_resource_public_1","module.rodin_http_proxy_resource_admin_1"]
  rest_api_id = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  stage_name  = "1"

}

# ------------------------------------------------------------------------------
# DALI API - RESOURCES DEP 1
# ------------------------------------------------------------------------------

module "rodin_http_proxy_resource_public_1" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource/"

  lambda            = "${module.lambda_deployment_1.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.root_resource_id}"
  resource_path     = "public"

}

module "rodin_http_proxy_resource_admin_1" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource/"

  lambda            = "${module.lambda_deployment_1.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.root_resource_id}"
  resource_path     = "admin"

}

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