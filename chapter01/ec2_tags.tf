# provider "aws" {
#   region = "us-east-1"
# }

resource "aws_instance" "web_frontend_tags" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = {
    Name = "web_frontend"
  }
}
