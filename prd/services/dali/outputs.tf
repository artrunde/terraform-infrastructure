# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------
output "dali_html_s3_website_endpoint" {
  value = "${module.dali_html.s3_website_endpoint}"
}

output "dali_assets_s3_website_endpoint" {
  value = "${module.dali_assets.s3_website_endpoint}"
}

output "dali_html_bucket_id" {
  value = "${module.dali_html.s3_bucket_id}"
}

output "dali_assets_bucket_id" {
  value = "${module.dali_assets.s3_bucket_id}"
}