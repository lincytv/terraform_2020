data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }
}


resource "aws_instance" "webserver" {
  ami           = data.aws_ami.latest_ami.id
  instance_type = var.instance_type
  key_name      = "ssm-test"
  #provider      = var.providers_aws
  tags = {
    Name = "webserver"
  }
}

output "ip" {
  value = aws_instance.webserver.public_ip
}
