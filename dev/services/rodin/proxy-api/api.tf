# ------------------------------------------------------------------------------
# DALI APIs - API
# ------------------------------------------------------------------------------

resource "aws_api_gateway_rest_api" "rodin_proxy_public_api_1" {
  name = "${var.namespace}_public_api_${var.terra_env}_1"
  // ACTIVE
}

resource "aws_api_gateway_rest_api" "rodin_proxy_public_api_2" {
  name = "${var.namespace}_public_api_${var.terra_env}_2"
  // STAGING
}

# ------------------------------------------------------------------------------
# DALI API - DEPLOYMENTS
# ------------------------------------------------------------------------------

resource "aws_api_gateway_deployment" "proxy_public_api_deployment_1" {

  depends_on  = ["module.rodin_http_proxy_resource_public_deployment_1","module.rodin_http_proxy_resource_admin_deployment_1"]
  rest_api_id = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  stage_name  = "1"

}

resource "aws_api_gateway_deployment" "proxy_public_api_deployment_2" {

  depends_on  = ["module.rodin_http_proxy_resource_public_deployment_2","module.rodin_http_proxy_resource_admin_deployment_2"]
  rest_api_id = "${aws_api_gateway_rest_api.rodin_proxy_public_api_2.id}"
  stage_name  = "2"

}
