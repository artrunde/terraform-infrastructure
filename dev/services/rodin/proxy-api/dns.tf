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
