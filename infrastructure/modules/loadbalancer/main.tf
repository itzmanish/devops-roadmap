resource "aws_lb_target_group" "docker_registry" {
  name     = var.lb_tg_name
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    matcher             = "200"
    path                = "/health"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "docker_registry" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.docker_registry.arn
  target_id        = var.instance_ids[count.index]
  port             = 5000
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.docker_registry.id
    type             = "forward"
  }
}

resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_sg_ids
  subnets            = var.subnets
}
