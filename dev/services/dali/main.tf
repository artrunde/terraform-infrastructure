module "dali_html" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../terraform-modules/aws/static-website/"

  # ------------------------------------------------------------------------------
  # STATIC WEBSITE S3 BUCKET
  # ------------------------------------------------------------------------------
  bucket_name     = "www-${var.terra_env}.artrunde.com"
  env             = "${var.terra_env}"
  root_domain     = "artrunde.com"

  # ------------------------------------------------------------------------------
  # DNS - USED FOR CDN ALIAS OR REGULAR ALIAS
  # ------------------------------------------------------------------------------
  alias_record    = "www-${var.terra_env}"

  # ------------------------------------------------------------------------------
  # CDN DISTRIBUTION
  # ------------------------------------------------------------------------------
  create_cdn              = false
  cdn_cache_min_ttl       = 0
  cdn_cache_default_ttl   = 60
  cdn_cache_max_ttl       = 300

  # ------------------------------------------------------------------------------
  # CERTIFICATE
  # ------------------------------------------------------------------------------
  cdn_acm_certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}

module "dali_assets" {

  //source = "git::git@github.com:artrunde/terraform-modules.git//s3-static-web?ref=0.1.2"
  source = "../../../../terraform-modules/aws/static-website/"

  # ------------------------------------------------------------------------------
  # STATIC WEBSITE S3 BUCKET
  # ------------------------------------------------------------------------------
  bucket_name     = "assets-${var.terra_env}.artrunde.com"
  env             = "${var.terra_env}"
  root_domain     = "artrunde.com"

  # ------------------------------------------------------------------------------
  # DNS - USED FOR CDN ALIAS OR REGULAR ALIAS
  # ------------------------------------------------------------------------------
  alias_record    = "assets-${var.terra_env}"

  # ------------------------------------------------------------------------------
  # CDN DISTRIBUTION
  # ------------------------------------------------------------------------------
  create_cdn              = false // Set this to true for production
  cdn_cache_min_ttl       = 86400
  cdn_cache_default_ttl   = 8640000
  cdn_cache_max_ttl       = 8640000 # 100 days

  # ------------------------------------------------------------------------------
  # CERTIFICATE
  # ------------------------------------------------------------------------------
  cdn_acm_certificate_arn = "arn:aws:acm:us-east-1:401237329133:certificate/890f1dd0-214f-48ab-a600-0e49942fbde5"

}
