# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "terra_env" {
  description = "Terraform environment. E.g dev/prd"
}

variable "namespace" {
  description = "Namespace of service"
}

variable "region" {
  description = "AWS region"
}

variable "account_id" {
  description = "AWS account ID"
}

variable "api_active_version_map" {
  description = "API version map e.g { v1 = \"jx0rutiyl0:0\", v2 = \"n1860xquh0:1\" }"
  type = "map"
}

variable "api_staging_version_map" {
  description = "API version map e.g { v1 = \"jx0rutiyl0:0\", v2 = \"n1860xquh0:1\" }"
  type = "map"
}
