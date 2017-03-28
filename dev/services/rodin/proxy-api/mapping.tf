# ------------------------------------------------------------------------------
# DNS FOR CUSTOM DOMAIN NAME
# ------------------------------------------------------------------------------

data "aws_route53_zone" "primary" {
  name = "artrunde.com."
  private_zone = false
}

resource "aws_route53_record" "example" {

  zone_id = "${data.aws_route53_zone.primary.id}"

  name = "${aws_api_gateway_domain_name.rodin_api_domain_name.domain_name}"
  type = "A"

  alias {
    name     = "${aws_api_gateway_domain_name.rodin_api_domain_name.cloudfront_domain_name}"
    zone_id  = "${aws_api_gateway_domain_name.rodin_api_domain_name.cloudfront_zone_id}"
    evaluate_target_health = true
  }

}

# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME - API PUBLIC MAPPING
# ------------------------------------------------------------------------------

resource "aws_api_gateway_base_path_mapping" "rodin_proxy_public_api_mapping" {

  api_id      = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  stage_name  = "${aws_api_gateway_deployment.proxy_public_api_deployment_1.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.rodin_api_domain_name.domain_name}"
  base_path   = "v1"

}

# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME
# ------------------------------------------------------------------------------

resource "aws_api_gateway_domain_name" "rodin_api_domain_name" {

  domain_name = "api-${var.namespace}-${var.terra_env}.artrunde.com"
  certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}

