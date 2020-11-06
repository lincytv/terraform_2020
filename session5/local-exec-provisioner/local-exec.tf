# provider "aws" {
#   region = "us-east-1"
# }

resource "aws_instance" "webserver" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  key_name      = "myserver"

  provisioner "local-exec" {
    command = "echo ${aws_instance.webserver.public_ip} > hosts && ANSIBLE_HOST_KEY_CHECKING=False && ansible -i ./hosts --private-key ./ssm-test.pem -m yum -a 'name=httpd state=latest' -m service -a 'name=httpd state=started' -u ec2-user -b all"
  }
  tags = {
    Name = "webserver"
  }
}
