# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "terra_env" {
  description = "Environment. E.g dev/stg/prd"
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