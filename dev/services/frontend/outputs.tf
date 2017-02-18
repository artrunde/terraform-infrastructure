# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------
output "frontend_html_s3_website_endpoint" {
  value = "${module.frontend-html.s3_website_endpoint}"
}

output "frontend_assets_s3_website_endpoint" {
  value = "${module.frontend-assets.s3_website_endpoint}"
}

output "frontend_html_bucket_id" {
  value = "${module.frontend-html.s3_bucket_id}"
}

output "frontend_assets_bucket_id" {
  value = "${module.frontend-assets.s3_bucket_id}"
}