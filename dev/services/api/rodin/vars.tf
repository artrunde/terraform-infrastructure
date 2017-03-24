# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "env" {
  description = "Environment. E.g dev/stg/prd"
}

variable "namespace" {
  description = "Namespace of API"
}

variable "account_id" {
  description = "AWS account number"
}

variable "region" {
  description = "AWS region"
}

variable "admin_api_name" {
  description = "Admin API name"
}

variable "public_api_name" {
  description = "Public API name"
}
