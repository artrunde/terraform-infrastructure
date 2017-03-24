# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME - API PUBLIC MAPPING
# ------------------------------------------------------------------------------

resource "aws_api_gateway_base_path_mapping" "rodin_proxy_public_api_mapping" {
  api_id      = "${aws_api_gateway_rest_api.rodin_proxy_public_api.id}"
  stage_name  = "${aws_api_gateway_deployment.proxy_public_api_deployment.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.rodin_api_domain_name.domain_name}"
  base_path   = "public"
}

# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME - API ADMIN MAPPING
# ------------------------------------------------------------------------------

resource "aws_api_gateway_base_path_mapping" "rodin_proxy_admin_api_mapping" {
  api_id      = "${aws_api_gateway_rest_api.rodin_proxy_admin_api.id}"
  stage_name  = "${aws_api_gateway_deployment.proxy_admin_api_deployment.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.rodin_api_domain_name.domain_name}"
  base_path   = "admin"
}