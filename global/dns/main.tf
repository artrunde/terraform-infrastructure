# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

# ------------------------------------------------------------------------------
# CONFIGURE DNS ROOT ZONE
# ------------------------------------------------------------------------------

resource "aws_route53_zone" "root" {
  name = "artrunde.com"
  tags {
    env = "prod"
  }
}

# ------------------------------------------------------------------------------
# CONFIGURE MAIL RECORDS
# ------------------------------------------------------------------------------

resource "aws_route53_record" "mail-mx" {

  zone_id = "${aws_route53_zone.root.zone_id}"
  name = "artrunde.com."
  type = "MX"
  ttl = "300"
  records = [
    "10 inbound-smtp.eu-west-1.amazonaws.com."
  ]
}

resource "aws_route53_record" "mail-autodiscover" {

  zone_id = "${aws_route53_zone.root.zone_id}"
  name = "autodiscover.artrunde.com."
  type = "CNAME"
  ttl = "300"
  records = [
    "autodiscover.mail.eu-west-1.awsapps.com."
  ]
}

resource "aws_route53_record" "mail-domainkey-01" {

  zone_id = "${aws_route53_zone.root.zone_id}"
  name = "igq2pdsgn5wntnoeljujo66zib6t3iex._domainkey.artrunde.com."
  type = "CNAME"
  ttl = "300"
  records = [
    "igq2pdsgn5wntnoeljujo66zib6t3iex.dkim.amazonses.com."
  ]
}

resource "aws_route53_record" "mail-domainkey-02" {

  zone_id = "${aws_route53_zone.root.zone_id}"
  name = "ut53hk64hamdnhz37i4mglge7k4mhwdx._domainkey.artrunde.com."
  type = "CNAME"
  ttl = "300"
  records = [
    "ut53hk64hamdnhz37i4mglge7k4mhwdx.dkim.amazonses.com."
  ]
}

resource "aws_route53_record" "mail-domainkey-03" {

  zone_id = "${aws_route53_zone.root.zone_id}"
  name = "b3cgk65xmmrdtkt57c2qcawoqctgsnf5._domainkey.artrunde.com."
  type = "CNAME"
  ttl = "300"
  records = [
    "b3cgk65xmmrdtkt57c2qcawoqctgsnf5.dkim.amazonses.com."
  ]
}