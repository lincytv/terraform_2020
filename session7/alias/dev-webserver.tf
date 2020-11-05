resource "aws_instance" "dev-webserver" {
  provider      = aws.dev
  ami           = data.aws_ami.latest_ami.id
  instance_type = "t3.micro"
  key_pair      = aws_key_pair.dev_kp.key_name
  tags = {
    Name = "${this.provider}-webserver"
  }
}
