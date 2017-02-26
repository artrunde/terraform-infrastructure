# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

# Filename for autodeploy
output "auto_deployment_filename" {
  value = "${module.lambda.auto_deployment_filename}"
}