# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "terra_env" {
  description = "Terraform environment. E.g dev/prd"
}

variable "namespace" {
  description = "Namespace of service"
}

variable "account_id" {
  description = "AWS account number"
}

variable "region" {
  description = "AWS region"
}

variable "custom_domain_deployments" {
  description = "Map of active and staging deployment name"
  type = "map"
}

variable "map_custom_domain" {
  description = "Map a custom domain for active API"
  type = "string"
}