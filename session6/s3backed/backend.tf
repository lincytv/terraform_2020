terraform {
  backend "s3" {
    bucket = "webapp-prod-statefiles"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
