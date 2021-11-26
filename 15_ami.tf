resource "aws_ami_from_instance" "useogi_ami" {
    name = "useogi-ami"
    source_instance_id = aws_instance.useogi_web.id
    depends_on = [
        aws_instance.useogi_web
    ]
}