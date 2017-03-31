# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "api_stage_map" {
  value = "${module.deployments.api_stage_map}"
}

output "api_urls" {
  value = "${module.deployments.api_urls}"
}

output "api_lambda_integrations" {
  value = "${module.deployments.api_lambda_integrations}"
}

output "lambda_active_v1" {
  value = "${ lookup(module.deployments.api_lambda_integrations , element( split(":", lookup( var.api_active_version_map, "v1", "none" ) ), 0 ), "unknown" ) }"
}

output "lambda_staging_v1" {
  value = "${ lookup(module.deployments.api_lambda_integrations , element( split(":", lookup( var.api_staging_version_map, "v1", "none" ) ), 0 ), "unknown" ) }"
}