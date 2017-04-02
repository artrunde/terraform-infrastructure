# ------------------------------------------------------------------------------
# MAPPING VERIONS - CHANGE HERE WHEN ADDING NEW URL VERSIONS
# ------------------------------------------------------------------------------

module "mapping" {

  source = "../../../../../terraform-modules/aws/base-path-mapping"

  stage_map   = "${ merge( module.blue.stage_map, module.green.stage_map ) }"
  active      = "${var.active}"
  version     = "${var.api_version}"

  domain_name = "api-${var.namespace}-${var.terra_env}.artrunde.com"

}