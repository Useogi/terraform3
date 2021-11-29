# alb
resource "aws_lb" "useogi_alb" {
    name = "${var.name}-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.useogi_sg.id]
    subnets = [aws_subnet.useogi_pub[0].id,aws_subnet.useogi_pub[1].id]
    tags = {
        "Name" = "${var.name}-alb"
    }
}

output "dns_name" {
    value = aws_lb.useogi_alb.dns_name
}

# albtg
resource "aws_lb_target_group" "useogi_albtg" {
    name = "${var.name}-albtg"
    port = var.port_http
    protocol = "HTTP"
    vpc_id = aws_vpc.useogi_vpc.id

    health_check {
        enabled = true
        healthy_threshold = 3
        interval = 5
        matcher = "200"
        path = "/health.html"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 2
        unhealthy_threshold = 2
    }
}

# alblis
resource "aws_lb_listener" "useogi_alblis" {
    load_balancer_arn = aws_lb.useogi_alb.id
    port = var.port_http
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.useogi_albtg.arn
    }
}