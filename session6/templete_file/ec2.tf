resource "aws_instance" "myec2" {
  ami           = ""
  instance_type = "t2.micro"
  key_pair      = ""
  user_data     = data.template_files.ec2_user_data_healthcheck

}
