
data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

variable "type" {
  type = map
  default = {
    "us-east-1" = "t2.small"
    "us-west-1" = "t2.micro"
    "us-west-1" = "t2.large"
  }
}


resource "aws_instance" "web-app" {

  ami = data.aws_ami.app_ami.id
  instance_type = var.type[var.region]
  tags = {
    Name = "web-app-${var.region}"
  }
}
