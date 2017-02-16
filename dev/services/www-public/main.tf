# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "www-public" {

  # ------------------------------------------------------------------------------
  # BLUEPRINT
  # ------------------------------------------------------------------------------
  source = "git::git@github.com:artrunde/terraform-modules.git//www-public?ref=0.1.1"
  source = "../../../../terraform-modules/www-public/"

  # ------------------------------------------------------------------------------
  # S3 BUCKETS
  # ------------------------------------------------------------------------------
  bucket_html   = "dev-www.artrunde.com"
  name_html     = "Frontend service for HTML"
  bucket_assets = "dev-assets.artrunde.com"
  name_assets   = "Frontend service for assets"

  # ------------------------------------------------------------------------------
  # DNS
  # ------------------------------------------------------------------------------
  record_www    = "dev-www"
  record_assets = "dev-assets"

  env  = "dev"
}