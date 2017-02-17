# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------
output "s3_www_website_endpoint" {
  value = "${module.frontend-static.s3_www_website_endpoint}"
}

output "s3_assets_website_endpoint" {
  value = "${module.frontend-static.s3_assets_website_endpoint}"
}

output "s3_www_bucket_domain_name" {
  value = "${module.frontend-static.s3_www_bucket_domain_name}"
}

output "s3_assets_bucket_domain_name" {
  value = "${module.frontend-static.s3_assets_bucket_domain_name}"
}

output "s3_www_bucket_id" {
  value = "${module.frontend-static.s3_www_bucket_id}"
}

output "s3_assets_bucket_id" {
  value = "${module.frontend-static.s3_assets_bucket_id}"
}