resource "aws_lb_target_group" "this" {
  name     = var.alb_target_group_name
  port     = var.alb_target_port
  protocol = var.alb_target_portocol
  vpc_id   = var.alb_vpc_id
  health_check {
    path = "/"
    port = 8080
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.alb_ec2_instance_id
  port             = var.alb_ec2_target_port
}