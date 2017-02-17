# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "frontend-static" {

  # ------------------------------------------------------------------------------
  # BLUEPRINT
  # ------------------------------------------------------------------------------
  //source = "git::git@github.com:artrunde/terraform-modules.git//www-public?ref=0.1.2"
  source = "../../../../terraform-modules/www-public/"

  # ------------------------------------------------------------------------------
  # S3 BUCKETS
  # ------------------------------------------------------------------------------
  bucket_www    = "dev-www.artrunde.com"
  name_www      = "Frontend service for HTML"
  bucket_assets = "dev-assets.artrunde.com"
  name_assets   = "Frontend service for assets"

  # ------------------------------------------------------------------------------
  # DNS - USED FOR CDN ALIAS OR REGULAR ALIAS
  # ------------------------------------------------------------------------------
  alias_record_www    = "dev-www"
  alias_record_assets = "dev-assets"

  # ------------------------------------------------------------------------------
  # CDN ASSETS
  # ------------------------------------------------------------------------------
  create_cdn_assets  = true // Creates DNS alias instead, if set to false
  cdn_assets_name    = "CDN distribution for dev assets"

  cdn_assets_cache_min_ttl      = 0
  cdn_assets_cache_default_ttl  = 60
  cdn_assets_cache_max_ttl      = 300

  # ------------------------------------------------------------------------------
  # CDN WWW
  # ------------------------------------------------------------------------------
  create_cdn_www  = true // Creates DNS alias instead, if set to false
  cdn_www_name    = "CDN distribution for dev www"

  cdn_www_cache_min_ttl      = 0
  cdn_www_cache_default_ttl  = 60
  cdn_www_cache_max_ttl      = 300

  # ------------------------------------------------------------------------------
  # TAGS
  # ------------------------------------------------------------------------------
  env  = "dev"

}