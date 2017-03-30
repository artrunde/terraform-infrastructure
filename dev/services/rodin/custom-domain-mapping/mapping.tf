# ------------------------------------------------------------------------------
# DNS FOR CUSTOM DOMAIN NAME
# ------------------------------------------------------------------------------

data "aws_route53_zone" "primary" {
  name = "artrunde.com."
  private_zone = false
}

resource "aws_route53_record" "example" {

  count = "${var.map_custom_domain}"

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
# BASE PATH MAPPING.
# ------------------------------------------------------------------------------

resource "aws_api_gateway_base_path_mapping" "rodin_proxy_public_api_mapping" {

  count = "${var.map_custom_domain}"

  api_id      = "${element(split(":", var.deployment_status["active"]),0)}"
  stage_name  = "${element(split(":", var.deployment_status["active"]),1)}"
  domain_name = "${aws_api_gateway_domain_name.rodin_api_domain_name.domain_name}"
  base_path   = "v1"

}

# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME
# ------------------------------------------------------------------------------

resource "aws_api_gateway_domain_name" "rodin_api_domain_name" {

  count = "${var.map_custom_domain}"

  domain_name = "api-${var.namespace}-${var.terra_env}.artrunde.com"
  certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}

