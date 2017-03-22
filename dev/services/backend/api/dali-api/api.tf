# ------------------------------------------------------------------------------
# DALI API - CREATES A API GATEWAY PROXY ENDPOINT
# ------------------------------------------------------------------------------

module "dali_public_http_proxy_resource" {

  source = "../../../../../../terraform-modules/api-lambda-proxy-resource/"

  lambda            = "${module.lambda.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.dali_proxy_api.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.dali_proxy_api.root_resource_id}"
  resource_path     = "${var.namespace}-public"

}

# Now, we need an API to expose those functions publicly
resource "aws_api_gateway_rest_api" "dali_proxy_api" {
  name = "${var.namespace}_${var.env}_api"
}
# We can deploy the API now! (i.e. make it publicly available)
resource "aws_api_gateway_deployment" "proxy_api_deployment" {
  depends_on  = ["module.dali_public_http_proxy_resource"]
  rest_api_id = "${aws_api_gateway_rest_api.dali_proxy_api.id}"
  stage_name  = "api"
}

