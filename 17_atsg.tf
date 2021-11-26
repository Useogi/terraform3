resource "aws_placement_group" "useogi_pg" {
    name = "useogi-pg"
    strategy = "cluster"
}

resource "aws_autoscaling_group" "useogi_atsg" {
    name = "useogi-atsg"
    min_size = 2
    max_size = 10
    health_check_grace_period = 60
    health_check_type = "EC2"
    desired_capacity = 2
    force_delete = true
    #placement_group = aws_placement_group.useogi_pg.name
    launch_configuration = aws_launch_configuration.useogi_lacf.name
    vpc_zone_identifier = [aws_subnet.useogi_puba.id,aws_subnet.useogi_pubc.id]
}