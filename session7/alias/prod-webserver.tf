resource "aws_instance" "dev-webserver" {
  provider      = aws.prod
  ami           = data.aws_ami.latest_ami.id
  instance_type = "t3.xlarge"
  key_pair      = aws_key_pair.prod_kp.key_name
}
