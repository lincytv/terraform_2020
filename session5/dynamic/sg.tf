variable "sg_ports" {
  type = list(number)
  default = [80,443,22,8900,9000,9001]
}

resource "aws_security_group" "elk_stack" {
    name = "elk_stack_sg"

    dynamic "ingress" {
      for_each = var.sg_ports
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
}
# with iterator name
resource "aws_security_group" "elk_stack_2" {
    name = "elk_stack_sg_2"

    dynamic "ingress" {
      for_each = var.sg_ports
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
}
