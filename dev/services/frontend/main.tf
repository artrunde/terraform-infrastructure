# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
  profile = "artrunde"
}

module "frontend-html" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../terraform-modules/static-website/"

  # ------------------------------------------------------------------------------
  # STATIC WEBSITE S3 BUCKET
  # ------------------------------------------------------------------------------
  bucket_name     = "dev-www.artrunde.com"
  env             = "dev"
  root_domain     = "artrunde.com"

  # ------------------------------------------------------------------------------
  # DNS - USED FOR CDN ALIAS OR REGULAR ALIAS
  # ------------------------------------------------------------------------------
  alias_record    = "dev-www"

  # ------------------------------------------------------------------------------
  # CDN DISTRIBUTION
  # ------------------------------------------------------------------------------
  create_cdn              = true
  cdn_cache_min_ttl       = 0
  cdn_cache_default_ttl   = 60
  cdn_cache_max_ttl       = 300

  # ------------------------------------------------------------------------------
  # CERTIFICATE
  # ------------------------------------------------------------------------------
  cdn_acm_certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}

module "frontend-assets" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../terraform-modules/static-website/"

  # ------------------------------------------------------------------------------
  # STATIC WEBSITE S3 BUCKET
  # ------------------------------------------------------------------------------
  bucket_name     = "dev-assets.artrunde.com"
  env             = "dev"
  root_domain     = "artrunde.com"

  # ------------------------------------------------------------------------------
  # DNS - USED FOR CDN ALIAS OR REGULAR ALIAS
  # ------------------------------------------------------------------------------
  alias_record    = "dev-assets"

  # ------------------------------------------------------------------------------
  # CDN DISTRIBUTION
  # ------------------------------------------------------------------------------
  create_cdn              = true
  cdn_cache_min_ttl       = 86400
  cdn_cache_default_ttl   = 8640000
  cdn_cache_max_ttl       = 8640000 # 100 days

  # ------------------------------------------------------------------------------
  # CERTIFICATE
  # ------------------------------------------------------------------------------
  cdn_acm_certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}