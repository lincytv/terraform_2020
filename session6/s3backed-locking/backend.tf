terraform {
  backend "s3" {
    bucket   = "webapp-prod-statefiles"
    key      = "terraform.tfstate"
    region   = "us-east-1"
    dynamodb = "webapp-state-lock" # create a LockID in dynamodb as key
  }
}
