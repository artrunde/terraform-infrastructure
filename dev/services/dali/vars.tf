# ---------------------------------------------------------------------------------------------------------------------
# PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "terra_env" {
  description = "Environment. E.g dev/stg/prd"
}

variable "namespace" {
  description = "Namespace of API"
}

variable "region" {
  description = "AWS region"
}

variable "circleci_dali_user" {
  description = "Username for the CircleCI user to access frontend (Get this from KeePass)"
}