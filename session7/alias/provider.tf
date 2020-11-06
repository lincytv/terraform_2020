provider "aws" {
  alias {
    aws = "dev"
  }
  region = "us-west-2"
}

provider "aws" {
  alias {
    aws = "prod"
  }
  region = "us-east-1"
}


provider "aws" {

  region = "us-east-1"
  assume_role {
    role_arn     = "#######"
    session_name = "prod1"
  }
}
