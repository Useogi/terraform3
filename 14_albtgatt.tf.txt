resource "aws_lb_target_group_attachment" "useogi_albtgatt" {
    target_group_arn = aws_lb_target_group.useogi_albtg.arn
    target_id = aws_instance.useogi_web.id
    port = 80
}