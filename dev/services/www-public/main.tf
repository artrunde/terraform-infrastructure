# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "www-public" {

  // Blueprint
  source = "git::git@github.com:artrunde/terraform-modules.git//www-public?ref=0.0.5"

  // HTML
  bucket_html = "dev-www.artrunde.com"
  name_html   = "Frontend service for HTML"

  // Assets
  bucket_assets = "dev-www.artrunde.com"
  name_assets   = "Frontend service for assets"

  // root domain
  bucket_root     = "dev.artrunde.com"
  name_root       = "Redirect root domain to www"
  redirect_all_to = "https://www.evercall.dk"

  env  = "dev"

}