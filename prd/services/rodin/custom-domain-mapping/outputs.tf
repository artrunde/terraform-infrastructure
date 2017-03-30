# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "lambda_active" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${element(split(":", var.deployment_status["active"]),1)}"
}

output "lambda_staging" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${element(split(":", var.deployment_status["staging"]),1)}"
}

output "active_v1_url" {
  value = "https://${aws_route53_record.example.name}/${aws_api_gateway_base_path_mapping.rodin_proxy_public_api_mapping_v1.base_path}/"
}
