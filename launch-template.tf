resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = "terraform-key"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG-Instance"
    }
  }
}