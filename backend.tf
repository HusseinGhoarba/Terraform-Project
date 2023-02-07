resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-tfstate-remote-bkend-9290"
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_s3_bucket_versioning" "enable_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_table" {
  name         = "terraform_table_for_userID"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

# terraform {
#   backend "s3" {
#     bucket = "terraform_tfstate_remote_bkend"
#     key    = "hussein/terraform.tfstate"
#     region = "us-west-1"

#     dynamodb_table = "terraform_table_for_userID"
#     encrypt = true
#   }
# }