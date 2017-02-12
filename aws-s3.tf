/* Setup our aws provider */
provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

resource "aws_s3_bucket" "test_bucket" {
    
    bucket = "s3-website-test.artrunde.com"
    acl = "public-read"

    website {
        index_document = "index.html"
        error_document = "error.html"
    }

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET","POST"]
        allowed_origins = ["*"]
        expose_headers = ["ETag"]
        max_age_seconds = 3000
    }

}