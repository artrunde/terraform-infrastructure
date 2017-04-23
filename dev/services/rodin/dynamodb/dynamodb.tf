# ------------------------------------------------------------------------------
# DALI API - DYNAMODB
# ------------------------------------------------------------------------------

resource "aws_dynamodb_table" "search_terms_dynamodb_table" {

  name = "${var.namespace}_search_terms_v1_${var.terra_env}"

  read_capacity   = 3
  write_capacity  = 3

  hash_key  = "search_term"
  range_key = "label"

  attribute {
    name = "search_term"
    type = "S"
  }

  attribute {
    name = "label"
    type = "S"
  }

  attribute {
    name = "belongs_to"
    type = "S"
  }

  global_secondary_index {
    name               = "BelongsToSearchTermIndex"
    hash_key           = "belongs_to"
    range_key          = "search_term"
    write_capacity     = 3
    read_capacity      = 3
    projection_type    = "ALL"
  }

  tags {
    name = "${var.namespace}_${var.terra_env}_search_terms"
    env = "${var.terra_env}"
  }
}

resource "aws_dynamodb_table" "tags_dynamodb_table" {

  name = "${var.namespace}_tags_v1_${var.terra_env}"

  read_capacity   = 3
  write_capacity  = 3

  hash_key  = "tag_id"
  range_key = "belongs_to"

  attribute {
    name = "tag_id"
    type = "S"
  }

  attribute {
    name = "belongs_to"
    type = "S"
  }

  attribute {
    name = "label"
    type = "S"
  }

  global_secondary_index {
    name               = "BelongsToTagIndex"
    hash_key           = "belongs_to"
    range_key          = "tag_id"
    write_capacity     = 3
    read_capacity      = 3
    projection_type    = "ALL"
  }

  global_secondary_index {
    name               = "LabelBelongsToIndex"
    hash_key           = "label"
    range_key          = "belongs_to"
    write_capacity     = 3
    read_capacity      = 3
    projection_type    = "KEYS_ONLY"
  }

  tags {
    name = "${var.namespace}_${var.terra_env}_tags"
    env = "${var.terra_env}"
  }
}

resource "aws_dynamodb_table" "places_dynamodb_table" {

  name = "${var.namespace}_places_v1_${var.terra_env}"

  read_capacity   = 3
  write_capacity  = 3

  hash_key = "place_id"

  attribute {
    name = "place_id"
    type = "S"
  }

  attribute {
    name = "url"
    type = "S"
  }

  global_secondary_index {
    name               = "urlIndex"
    hash_key           = "url"
    write_capacity     = 3
    read_capacity      = 3
    projection_type    = "ALL"
  }

  tags {
    name = "${var.namespace}_${var.terra_env}_places"
    env = "${var.terra_env}"
  }

}
