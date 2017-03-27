# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "lambda_filename_staging" {
  value = "${module.lambda_deployment_2.auto_deployment_filename}"
}
output "lambda_filename_active" {
  value = "${module.lambda_deployment_1.auto_deployment_filename}"
}
