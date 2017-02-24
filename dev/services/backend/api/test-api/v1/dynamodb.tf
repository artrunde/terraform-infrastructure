# ------------------------------------------------------------------------------
# TEST API - DYNAMODB
# ------------------------------------------------------------------------------

resource "aws_dynamodb_table" "basic-dynamodb-table" {

  name = "subscribers"

  read_capacity   = 3
  write_capacity  = 3

  hash_key = "email"

  attribute {
    name = "email"
    type = "S"
  }

  tags {
    name = "dynamo-table-subscribers"
    env = "dev"
  }
}



