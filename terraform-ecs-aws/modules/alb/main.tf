resource "aws_security_group" "alb_sg" {
  name   = "${var.name_prefix}-alb-sg"
  vpc_id = var.vpc_id
  description = "Allow HTTP from ingress CIDR"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [var.alb_sg_ingress_cidr]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "this" {
  name = "${var.name_prefix}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg.id]
  subnets = var.public_subnet_ids
}

resource "aws_lb_target_group" "this" {
  name_prefix = "${var.name_prefix}-tg"
  port = var.target_group_port
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    port = "traffic-port"
    interval = 30
    healthy_threshold = 2
    unhealthy_threshold = 2
    matcher = "200-399"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}

