resource "aws_launch_configuration" "useogi_lacf" {
    name = "useogi-lacf"
    image_id = aws_ami_from_instance.useogi_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = "admin_role"
    security_groups = [aws_security_group.useogi_sg.id]
    key_name = "useogi-key"
    user_data =<<-EOF
                    #/bin/bash
                    systemctl start http
                    systemctl enable httpd
                    EOF
}