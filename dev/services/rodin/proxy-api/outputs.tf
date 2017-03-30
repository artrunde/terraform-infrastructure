# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

// TODO make this dynamic with "count"
output "deployment_ids" {

  value = [
    "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}:${aws_api_gateway_deployment.proxy_public_api_deployment_1.stage_name}"
  ]

}

// TODO make this dynamic with "count"
output "deployment_urls" {

  value = [
    "https://${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_deployment.proxy_public_api_deployment_1.stage_name}/"
  ]

}