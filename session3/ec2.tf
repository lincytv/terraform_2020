resource "aws_instance" "web_frontend_output" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  iam_instance_profile = "aws-tagger-role"
  key_name = "ssm-test"
  tags = {
    Name = "web_frontend"
  }

}
output  "publicip" {
  value = aws_instance.web_frontend_output.public_ip
}
output  "instance_id" {
  value = aws_instance.web_frontend_output.id
}
