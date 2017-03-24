# ------------------------------------------------------------------------------
# DALI API - RESOURCES
# ------------------------------------------------------------------------------

module "rodin_admin_http_proxy_resource" {

  source = "../../../../../terraform-modules/api-lambda-proxy-resource/"

  lambda            = "${module.lambda.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "AWS_IAM"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_admin_api.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_admin_api.root_resource_id}"

}

# ------------------------------------------------------------------------------
# DALI API - API
# ------------------------------------------------------------------------------

resource "aws_api_gateway_rest_api" "rodin_proxy_admin_api" {
  name = "${var.namespace}_admin_api_${var.env}"
}

# ------------------------------------------------------------------------------
# DALI API - DEPLOYMENTS
# ------------------------------------------------------------------------------

resource "aws_api_gateway_deployment" "proxy_admin_api_deployment" {

  depends_on  = ["module.rodin_admin_http_proxy_resource"]
  rest_api_id = "${aws_api_gateway_rest_api.rodin_proxy_admin_api.id}"
  stage_name  = "rodin"

}