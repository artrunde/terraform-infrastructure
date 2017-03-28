# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "lambda_active" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${aws_api_gateway_base_path_mapping.rodin_proxy_public_api_mapping.stage_name}"
}

output "lambda_staging" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${lookup(var.deployments, "staging")}"
}
