resource "aws_lb_listener" "useogi_alblis" {
    load_balancer_arn = aws_lb.useogi_alb.id
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.useogi_albtg.arn
    }
}
