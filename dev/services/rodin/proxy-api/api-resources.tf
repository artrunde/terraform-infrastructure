# ------------------------------------------------------------------------------
# DALI API - RESOURCES DEP 1
# ------------------------------------------------------------------------------

module "rodin_http_proxy_resource_public_deployment_1" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource/"

  lambda            = "${module.lambda_deployment_1.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.root_resource_id}"
  resource_path     = "public"

}

module "rodin_http_proxy_resource_admin_deployment_1" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource/"

  lambda            = "${module.lambda_deployment_1.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_public_api_1.root_resource_id}"
  resource_path     = "admin"

}

# ------------------------------------------------------------------------------
# DALI API - RESOURCES DEP 2
# ------------------------------------------------------------------------------

module "rodin_http_proxy_resource_public_deployment_2" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource/"

  lambda            = "${module.lambda_deployment_2.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_public_api_2.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_public_api_2.root_resource_id}"
  resource_path     = "public"

}

module "rodin_http_proxy_resource_admin_deployment_2" {

  source = "../../../../../terraform-modules/aws/api-lambda-proxy-resource/"

  lambda            = "${module.lambda_deployment_2.function_name}"
  region            = "${var.region}"
  account_id        = "${var.account_id}"
  authorization     = "NONE"
  api_id            = "${aws_api_gateway_rest_api.rodin_proxy_public_api_2.id}"
  root_resource_id  = "${aws_api_gateway_rest_api.rodin_proxy_public_api_2.root_resource_id}"
  resource_path     = "admin"

}