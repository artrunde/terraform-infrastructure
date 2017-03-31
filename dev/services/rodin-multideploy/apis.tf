# ------------------------------------------------------------------------------
# RODIN API
# ------------------------------------------------------------------------------

module "deployments" {

  source = "../../../../terraform-modules/aws/multi-proxy-api-deployment"

  terra_env   = "${var.terra_env}"
  namespace   = "${var.namespace}"
  region      = "${var.region}"
  account_id  = "${var.account_id}"

  # ------------------------------------------------------------------------------
  # Number og APIs
  # ------------------------------------------------------------------------------
  api_count = 2

}