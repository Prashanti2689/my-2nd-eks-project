terraform {
  backend "s3" {
    bucket = "my-practice-bucket-prash"
    key    = "state"
    region = "us-east-1"
    dynamodb_table = "backend"
  }
}
