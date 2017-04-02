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

variable "api_version" {
  description = "E.g v1, v2..."
}

variable "active_stage" {
  description = "Active stage \"blue\" or \"green\". Get current with 'terraform output active_stage'"
}

/*
Deletes old staging env nd creates new for staging
1. terraform taint -module=blue aws_api_gateway_rest_api.proxy_public_api
2. terraform plan $(terraform output active_stage)
3. terraform apply $(terraform output active_stage)

Deletes old staging env nd creates new for staging
1. terraform taint -module=blue aws_api_gateway_rest_api.proxy_public_api
2. terraform plan blue
3. terraform apply $(terraform output active_stage)
*/