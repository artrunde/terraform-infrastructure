# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "frontend-html" {

  source = "../../../modules/www-public-html"
  bucket  = "dev-www.artrunde.com"
  name = "Frontend service for HTML"
  env  = "dev"

}

module "frontend-assets" {

  source = "../../../modules/www-public-assets"
  bucket  = "dev-assets.artrunde.com"
  name = "Frontend service for assets"
  env  = "dev"

}