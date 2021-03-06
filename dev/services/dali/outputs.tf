# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------
output "html_s3_website_endpoint" {
  value = "https://${module.dali_html.s3_website_endpoint}"
}

output "assets_s3_website_endpoint" {
  value = "https://${module.dali_assets.s3_website_endpoint}"
}

output "html_bucket_id" {
  value = "${module.dali_html.s3_bucket_id}"
}

output "assets_bucket_id" {
  value = "${module.dali_assets.s3_bucket_id}"
}