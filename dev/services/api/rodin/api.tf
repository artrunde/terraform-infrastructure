# ------------------------------------------------------------------------------
# DALI API - CREATES A API GATEWAY PROXY ENDPOINT
# ------------------------------------------------------------------------------

module "rodin_public_http_proxy_resource" {

  source = "../../../../../terraform-modules/api-lambda-proxy-resource/"

  lambda            = "${module.lambda.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_api.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_api.root_resource_id}"
  resource_path     = "${var.namespace}-public"

}

resource "aws_api_gateway_rest_api" "rodin_proxy_api" {

  name = "${var.namespace}_api_${var.env}"

}

resource "aws_api_gateway_deployment" "proxy_api_deployment" {

  depends_on  = ["module.rodin_public_http_proxy_resource"]
  rest_api_id = "${aws_api_gateway_rest_api.rodin_proxy_api.id}"
  stage_name  = "api"

}

