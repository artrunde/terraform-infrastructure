# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "www-public" {

  // Blueprint
  // source = "git::git@github.com:artrunde/terraform-modules.git//www-public?ref=0.1.0"
  source = "../../../../terraform-modules/www-public/"

  // HTML
  bucket_html = "dev-www.artrunde.com"
  name_html   = "Frontend service for HTML"

  // Assets
  bucket_assets = "dev-assets.artrunde.com"
  name_assets   = "Frontend service for assets"

  env  = "dev"
}