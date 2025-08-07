resource "aws_lb" "app_lb" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnet_ids
  security_groups    = [var.lb_sg_id]

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
