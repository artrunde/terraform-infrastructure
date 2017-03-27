# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME - API PUBLIC MAPPING
# ------------------------------------------------------------------------------

resource "aws_api_gateway_base_path_mapping" "rodin_proxy_public_api_mapping_1" {
  api_id      = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  stage_name  = "${aws_api_gateway_deployment.proxy_public_api_deployment_1.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.rodin_api_domain_name.domain_name}"
  base_path   = "v1"
}