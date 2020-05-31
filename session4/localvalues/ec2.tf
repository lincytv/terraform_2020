locals {
  common_tags = {
    Owner = "Devops Team"
    service = "FrontEnd"
    Backup = "True"
  }
}


resource "aws_instance" "web_frontend_1" {

  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = local.common_tags

}

resource "aws_instance" "web_frontend_2" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.small"
  tags = local.common_tags
}
