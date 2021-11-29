# ami
resource "aws_ami_from_instance" "useogi_ami" {
    name = "${var.name}-ami"
    source_instance_id = aws_instance.useogi_web.id
    depends_on = [
        aws_instance.useogi_web
    ]
}

# lacf
resource "aws_launch_configuration" "useogi_lacf" {
    name = "${var.name}-lacf"
    image_id = aws_ami_from_instance.useogi_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = "admin_role"
    security_groups = [aws_security_group.useogi_sg.id]
    key_name = "${var.name}-key"
    user_data =<<-EOF
                    #/bin/bash
                    systemctl start http
                    systemctl enable httpd
                    EOF
}

# atsg
resource "aws_placement_group" "useogi_pg" {
    name = "${var.name}-pg"
    strategy = "cluster"
}

resource "aws_autoscaling_group" "useogi_atsg" {
    name = "${var.name}-atsg"
    min_size = 2
    max_size = 10
    health_check_grace_period = 60
    health_check_type = "EC2"
    desired_capacity = 2
    force_delete = false
    #placement_group = aws_placement_group.useogi_pg.name
    launch_configuration = aws_launch_configuration.useogi_lacf.name
    vpc_zone_identifier = [aws_subnet.useogi_pub[0].id,aws_subnet.useogi_pub[1].id]
}

# asatt
resource "aws_autoscaling_attachment" "useogi_asatt" {
    autoscaling_group_name = aws_autoscaling_group.useogi_atsg.id
    alb_target_group_arn = aws_lb_target_group.useogi_albtg.arn
}