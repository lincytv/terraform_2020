resource "aws_elb" "frontend-elb" {
    name = var.frontend-elb
    availability_zones = var.az

    listener {
      instance_port = 80
      instance_protocol = "http"
      lb_port = 80
      lb_protocol = "http"
    }

    # listener {
    #   instance_port = 443
    #   instance_protocol = "https"
    #   lb_port = 443
    #   lb_protocol = "https"
    # }
    health_check {
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = 3
      target = "HTTP:80/"
      interval = 30
    }

    cross_zone_load_balancing = true
    idle_timeout = var.timeout

    tags = {
      Name = "frontend-elb"
    }
}
