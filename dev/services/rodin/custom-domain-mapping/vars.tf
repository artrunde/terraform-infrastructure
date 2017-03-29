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

variable "custom_domain_deployments" {
  description = "Use custom domain mapping for API? true/false"
  type = "map"
}

variable "map_custom_domain" {
  description = "Map a custom domain for active API. api.id:stage"
  type = "string"
  default = false
}