# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "stage_map" {
  value = "${ merge(module.green.stage_map, module.blue.stage_map) }"
}

output "urls" {
  value = "${ merge( module.green.url, module.blue.url ) }"
}

output "lambda_integrations" {
  value = "${ merge(module.green.lambda_integration, module.blue.lambda_integration) }"
}

output "active_stage" {
  value = "${ var.active_stage }"
}

output "active_url" {
  value = "${module.mapping.active_url}"
}

/*
/*
output "lambda_active_v1" {
  value = "${ lookup(module.blue.api_lambda_integrations , element( split(":", lookup( var.api_active_version_map, "v1", "none" ) ), 0 ), "unknown" ) }"
}

output "lambda_staging_v1" {
  value = "${ lookup(module.blue.api_lambda_integrations , element( split(":", lookup( var.api_staging_version_map, "v1", "none" ) ), 0 ), "unknown" ) }"
}*/