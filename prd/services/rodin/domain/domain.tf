# ------------------------------------------------------------------------------
# DATA FOR ZONE
# ------------------------------------------------------------------------------

data "aws_route53_zone" "primary" {
  name = "artrunde.com."
  private_zone = false
}

module "custom_domain" {

  source = "../../../../../terraform-modules/aws/api-custom-domain"

  domain_name     = "api-${var.namespace}-${var.terra_env}.artrunde.com"
  certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"
  zone_id         = "${data.aws_route53_zone.primary.id}"

}