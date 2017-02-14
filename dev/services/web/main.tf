module "frontend-html" {

  source = "git::ssh://git@github.com/artrunde/terraform-infrastructure.git//modules/www-public-html?ref=v0.0.1"

  bucket  = "${var.bucket_name}"
  acl     = "${var.bucket_acl}"
  bucket  = "dev-www.artrunde.com"

}