resource "aws_lb" "web_alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.web_sg.id
  ]

  subnets = [
    aws_subnet.public.id,
    aws_subnet.public2.id
  ]

  tags = {
    Name = "Terraform-ALB"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}