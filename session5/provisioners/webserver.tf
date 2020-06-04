resource "aws_instance" "webserver" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  key_name      = "ssm-test"
}

provisioner "remote-exec" {

  inline = [
    "sudo yum install httpd -y",
    "sudo systemctl enable httpd",
    "sudo systemctl start httpd"
  ]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = "${file("~lincytv/Downlods/ssm-test.pem")}"
  }
}
