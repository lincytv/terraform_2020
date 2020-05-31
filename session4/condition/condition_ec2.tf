# env=dev env=prod
variable "env" {}

resource "aws_instance" "prod_web_frontend" {

    ami = "ami-0323c3dd2da7fb37d"
    instance_type = "t3.large"
    count = var.env == "prod" ? 1: 0
    tags = {
      Name = "prod_web_frontend"
    }
}

resource "aws_instance" "stage_web_frontend" {

    ami = "ami-0323c3dd2da7fb37d"
    instance_type = "t2.medium"
    count = var.env == "stage" ? 1: 0
    tags = {
      Name = "stage_web_frontend"
    }
}

resource "aws_instance" "dev_web_frontend" {

    ami = "ami-0323c3dd2da7fb37d"
    instance_type = "t3.small"
    count = var.env == "dev" ? 1: 0
    tags = {
      Name = "dev_web_frontend"
    }
}
