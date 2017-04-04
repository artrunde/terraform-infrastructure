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

variable "active" {
  description = "Active stage \"blue\" or \"green\". Get current with 'terraform output active'"
}

/*
Lets say green environment i currently active.

Delete old staging environment and create new:
1. terraform taint -module=blue aws_api_gateway_rest_api.proxy_public_api
2. terraform plan -var active=$(terraform output active)
3. terraform apply -var active=$(terraform output active)

Delete old staging env, creates new and activate
1. terraform taint -module=blue aws_api_gateway_rest_api.proxy_public_api
2. terraform plan -var active=blue
3. terraform apply -var active=blue

active = green
active_url = https://api-rodin-dev.artrunde.com/v1/
lambda_integrations = {
  blue = rodin_v1_blue_dev
  green = rodin_v1_green_dev
}
stage_map = {
  blue = zjt07xt367
  green = 86dnw99iul
}
urls = {
  blue = https://zjt07xt367.execute-api.eu-west-1.amazonaws.com/blue/
  green = https://86dnw99iul.execute-api.eu-west-1.amazonaws.com/green/
}

Outputs:

active = blue
active_url = https://api-rodin-dev.artrunde.com/v1/
lambda_integrations = {
  blue = rodin_v1_blue_dev
  green = rodin_v1_green_dev
}
stage_map = {
  blue = 5qkkppmnrk
  green = 86dnw99iul
}
urls = {
  blue = https://5qkkppmnrk.execute-api.eu-west-1.amazonaws.com/blue/
  green = https://86dnw99iul.execute-api.eu-west-1.amazonaws.com/green/
}




*/


