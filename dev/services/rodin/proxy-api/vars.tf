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

variable "deployments" {
  description = "Map og active and staging deployment name"
  type = "map"
}