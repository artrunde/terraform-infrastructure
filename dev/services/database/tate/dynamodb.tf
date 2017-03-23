# ------------------------------------------------------------------------------
# DALI API - DYNAMODB
# ------------------------------------------------------------------------------

resource "aws_dynamodb_table" "search_terms_dynamodb_table" {

  name = "${var.namespace}_search_terms_${var.env}"

  read_capacity   = 3
  write_capacity  = 3

  hash_key = "search_term_id"

  attribute {
    name = "search_term_id"
    type = "S"
  }

  range_key = "priority"

  attribute {
    name = "priority"
    type = "N"
  }

  tags {
    name = "${var.namespace}_search_terms_${var.env}"
    env = "${var.env}"
  }
}

resource "aws_dynamodb_table" "tags_dynamodb_table" {

  name = "${var.namespace}_tags_${var.env}"

  read_capacity   = 3
  write_capacity  = 3

  hash_key = "tag_id"

  attribute {
    name = "tag_id"
    type = "S"
  }

  range_key = "place_id"

  attribute {
    name = "place_id"
    type = "S"
  }

  tags {
    name = "${var.namespace}_tags_${var.env}"
    env = "${var.env}"
  }
}

resource "aws_dynamodb_table" "places_dynamodb_table" {

  name = "${var.namespace}_places_${var.env}"

  read_capacity   = 3
  write_capacity  = 3

  hash_key = "place_id"

  attribute {
    name = "place_id"
    type = "S"
  }

  tags {
    name = "${var.namespace}_places_${var.env}"
    env = "${var.env}"
  }
}
