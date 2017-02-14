# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket_name" {
  description = "The name for the S3 bucket"
}

variable "cache_max_age" {
  description = "HTTP header max-age for caching"
}

variable "bucket_acl" {
  description = "The name of the bucket for assets"
  default     = "public-read"
}
