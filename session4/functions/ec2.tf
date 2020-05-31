variable "region" {}

variable "regions_ami" {
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0e34e7b9ca0ace12d"
    "ap-southeast-1" = "ami-0615132a0f36d24f4"
  }
}

variable "tags" {
  default = ["first",  "second"]
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

resource "aws_key_pair" "app-dev-kp" {
     key_name = "app-dev-key"
     public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
    ami = lookup(var.regions_ami, var.region)
    instance_type = "t2.micro"
    key_name = aws_key_pair.app-dev-kp.key_name
    count = 2

    tags = {
      Name = element(var.tags,count.index)
      created_time = local.time
    }
}

output "timestamp" {
  value = local.time
}
