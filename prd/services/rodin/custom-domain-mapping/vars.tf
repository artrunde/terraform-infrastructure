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

variable "deployment_status" {
  description = "Map of API ids and stages for mapping active deployment {status = api.id:stage}"
  type = "map"
}

variable "map_custom_domain" {
  description = "Use custom domain mapping for API? true/false"
  type = "string"
  default = false
}