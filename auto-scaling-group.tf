resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 2
  max_size         = 3
  min_size         = 2

  vpc_zone_identifier = [
    aws_subnet.public.id,
    aws_subnet.public2.id
  ]

  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ASG-Instance"
    propagate_at_launch = true
  }
}