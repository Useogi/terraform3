resource "aws_lb" "useogi_alb" {
    name = "useogi-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.useogi_sg.id]
    subnets = [aws_subnet.useogi_puba.id,aws_subnet.useogi_pubc.id]
    tags = {
        "Name" = "useogi-alb"
    }
}

output "dns_name" {
    value = aws_lb.useogi_alb.dns_name
}