resource "aws_elb" "web_elb" {
  name = "web-elb"
  security_groups = [aws_security_group.elb_sg.id]
  availability_zones = data.aws_availability_zones.available.names

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port          = 80
    lb_protocol      = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target             = "HTTP:80/"
    interval           = 30
  }

  tags = var.project_tags
}

resource "aws_security_group" "elb_sg" {
  name        = "elb_sg"
  description = "Security group for ELB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.project_tags
}

data "aws_availability_zones" "available" {
  state = "available"
}