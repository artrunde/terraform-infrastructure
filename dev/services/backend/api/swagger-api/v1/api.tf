# ------------------------------------------------------------------------------
# TEST API
# ------------------------------------------------------------------------------

# Now, we need an API to expose those functions publicly
resource "aws_api_gateway_rest_api" "test_api" {
  name = "TestSwagger"
}

resource "aws_lambda_permission" "allow_api_gateway" {

  function_name = "${module.lambda.function_name}"
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:eu-west-1:401237329133:${aws_api_gateway_rest_api.test_api.id}/*"

}

# We can deploy the API now! (i.e. make it publicly available)
resource "aws_api_gateway_deployment" "test_api_deployment" {

  rest_api_id = "${aws_api_gateway_rest_api.test_api.id}"
  stage_name  = "v1"
  description = "Swagger deployment"

}

