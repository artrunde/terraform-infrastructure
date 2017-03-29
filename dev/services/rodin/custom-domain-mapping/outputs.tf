# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "lambda_active" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${element(split(":", var.custom_domain_deployments["active"]),1)}"
}

output "lambda_staging" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${element(split(":", var.custom_domain_deployments["staging"]),1)}"
}
