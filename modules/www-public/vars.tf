# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "html_bucket_name" {
  description = "The name for the bucket for HTML. Will have an max-age header"  
}

variable "max-age" {
  description = "HTTP header max-age for caching"
}

variable "asset_bucket_name" {
  description = "The name of the bucket for assets"
}