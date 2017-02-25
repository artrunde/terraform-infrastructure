# ------------------------------------------------------------------------------
# TEST API
# ------------------------------------------------------------------------------

# We can deploy the API now! (i.e. make it publicly available)
resource "aws_api_gateway_deployment" "test_api_deployment" {

  rest_api_id = "${aws_api_gateway_rest_api.test_api.id}"
  stage_name  = "v1"
  description = "Deploy methods: ${module.test_get.http_method}"

}

# Until now, the resource created could not respond to anything. We must set up
# a HTTP method (or verb) for that!
# This is the code for method GET /hello, that will talk to the first lambda
module "test_get" {

  source = "../../../../../../../terraform-modules/api-method/"

  rest_api_id = "${aws_api_gateway_rest_api.test_api.id}"
  resource_id = "${aws_api_gateway_resource.test_api_res_hello.id}"
  method      = "GET"
  path        = "${aws_api_gateway_resource.test_api_res_hello.path}"
  lambda      = "${module.lambda.function_name}"
  region      = "eu-west-1"
  account_id  = "401237329133"
}

# Now, we need an API to expose those functions publicly
resource "aws_api_gateway_rest_api" "test_api" {
  name = "TestAPI"
}

# The API requires at least one "endpoint", or "resource" in AWS terminology.
# The endpoint created here is: /hello
resource "aws_api_gateway_resource" "test_api_res_hello" {
  rest_api_id = "${aws_api_gateway_rest_api.test_api.id}"
  parent_id   = "${aws_api_gateway_rest_api.test_api.root_resource_id}"
  path_part   = "hello"
}

