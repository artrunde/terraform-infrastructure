# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

output "lambda_active" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${element(split(":", var.deployment_status["active"]),1)}"
}

output "lambda_staging" {
  value = "${var.namespace}_php_lambda_proxy_${var.terra_env}_${element(split(":", var.deployment_status["staging"]),1)}"
}
