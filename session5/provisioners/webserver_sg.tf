resource "aws_security_group" "webserver-sg" {
  name = "webserver-sg"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.webserver-sg.id
  network_interface_id = aws_instance.webserver.primary_network_interface_id
}
