
resource "aws_instance" "web-frontend" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = "web-frontend-${count.index}"
  }
}
