# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "frontend-html" {

  source = "../../../modules/www-public-html"
  bucket  = "www.artrunde.com"
  name = "Frontend service for HTML"
  env  = "prod"

}

module "frontend-assets" {

  source = "../../../modules/www-public-assets"
  bucket  = "assets.artrunde.com"
  name = "Frontend service for assets"
  env  = "prod"

}