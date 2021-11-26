resource "aws_autoscaling_attachment" "useogi_asatt" {
    autoscaling_group_name = aws_autoscaling_group.useogi_atsg.id
    alb_target_group_arn = aws_lb_target_group.useogi_albtg.arn
}