
locals {
  env = terraform.workspace
  counts = {
    "dev"=1
    "prod"=3
    "stage"=2
  }
  instances = {
    "dev" = "t2.micro"
    "prod" = "t5.large"
    "stage" = "t3.small"
  }

  instance_type=lookup(local.instances,local.env)
  count=lookup(local.counts,local.env)
}

resource "aws_instance" "my_service" {
    ami = "ami-0323c3dd2da7fb37d"
    instance_type = local.instance_type
    count = local.count
}
