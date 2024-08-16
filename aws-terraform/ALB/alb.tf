resource "aws_lb" "this" {
    name               = var.alb_name
    internal           = false
    security_groups    = var.alb_security_group
    subnets            = var.alb_subnets
}

resource "aws_lb_listener" "lb_listener_http" {
   load_balancer_arn    = aws_lb.this.id
   port                 = "80"
   protocol             = "HTTP"
   default_action {
    target_group_arn = aws_lb_target_group.this.id
    type             = "forward"
  }
}

