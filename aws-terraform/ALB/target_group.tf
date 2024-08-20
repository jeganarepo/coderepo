resource "aws_lb_target_group" "this" {
  name     = var.alb_target_group_name
  port     = var.alb_ec2_target_port
  protocol = var.alb_target_portocol
  vpc_id   = var.alb_vpc_id
  health_check {
    path                = var.alb_health_check["path"]
    port                = var.alb_health_check["port"]
    healthy_threshold   = var.alb_health_check["healthy_threshold"]
    unhealthy_threshold = var.alb_health_check["unhealthy_threshold"]
    timeout             = var.alb_health_check["timeout"]
    interval            = var.alb_health_check["interval"]
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.alb_ec2_instance_id
  port             = var.alb_ec2_target_port
}