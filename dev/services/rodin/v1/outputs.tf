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

output "active" {
  value = "${ var.active }"
}

output "active_url" {
  value = "${module.mapping.active_url}"
}