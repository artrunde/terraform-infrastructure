# ------------------------------------------------------------------------------
# CUSTOM DOMAIN NAME
# ------------------------------------------------------------------------------

resource "aws_api_gateway_domain_name" "rodin_api_domain_name" {

  domain_name = "api-${var.namespace}-${var.env}.artrunde.com"

  certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}

