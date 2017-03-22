# ------------------------------------------------------------------------------
# TEST API - CREATES A API GATEWAY PROXY ENDPOINT
# ------------------------------------------------------------------------------

# Until now, the resource created could not respond to anything. We must set up
# a HTTP method (or verb) for that!
# This is the code for method GET /hello, that will talk to the first lambda
module "demo_http_proxy" {

  source = "../../../../../../../terraform-modules/api-lambda-proxy/"

  lambda      = "${module.lambda.function_name}"
  region      = "eu-west-1"
  account_id  = "401237329133"
  api_name    = "DaliAPI"

}