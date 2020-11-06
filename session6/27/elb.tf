resource "aws_security_group" "web-frontend-sg" {
  name   = "web-frontend-sg"
  vpc_id = module.myvpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "2.4.0"
  # insert the 6 required variables here
  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    }
  ]
  name            = "myelb"
  subnets         = [module.myvpc.public_subnet_01, module.myvpc.public_subnet_02]
  security_groups = [aws_security_group.web-frontend-sg.id]
}
