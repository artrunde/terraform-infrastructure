module "frontend-html" {

  source = "https://github.com/artrunde/terraform-infrastructure.git?ref=v0.0.1"

  bucket  = "${var.bucket_name}"
  acl     = "${var.bucket_acl}"
  bucket  = "dev-www.artrunde.com"

}

module "frontend-assets" {

  source = "https://github.com/artrunde/terraform-infrastructure.git?ref=v0.0.1"
  bucket  = "dev-assets.artrunde.com"
}