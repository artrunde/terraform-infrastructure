# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

# Filename for autodeploy
output "auto_deployment_filename" {
  value = "${module.lambda.auto_deployment_filename}"
}

# HTTP endpoint
output "http_stage_endpoint" {
  value = "${module.demo_http_proxy.http_stage_endpoint}"
}