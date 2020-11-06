resource "aws_instance" "myec2" {
  ami               = "ami-085925f297f89fce1"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  key_name          = "websrv"
  subnet_id         = "subnet-91f181cd"
  #security_groups   = ["websrv"]

}
