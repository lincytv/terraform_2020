resource "aws_instance" "webserver" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = var.instance_type
  key_name      = "ssm-test"
  tags = {
    Name = "webserver"
  }
}
