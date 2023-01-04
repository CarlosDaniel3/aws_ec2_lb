resource "aws_lb" "alb" {
  name            = "Terraform-ALB"
  security_groups = [aws_security_group.web.id]
  subnets         = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ec2_vpc.id
}

