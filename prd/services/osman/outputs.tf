# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "auto_deploy_bucket_name" {
  value = "${module.osman_lambda_deploy.auto_deploy_bucket_name}"
}