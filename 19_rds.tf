resource "aws_db_instance" "useogi_mydb" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t2.micro"
    name = "mydb"
    identifier = "mydb"
    username = "admin"
    password = "!didqocn12"
    parameter_group_name = "default.mysql8.0"
    availability_zone = "ap-northeast-2a"
    db_subnet_group_name = aws_db_subnet_group.useogi_dbsg.id
    vpc_security_group_ids = [aws_security_group.useogi_sg.id]
    skip_final_snapshot = true
    tags = {
        "Name" = "useogi-db"
    }
}

resource "aws_db_subnet_group" "useogi_dbsg" {
    name = "useogi-dbsg"
    subnet_ids = [aws_subnet.useogi_pridba.id,aws_subnet.useogi_pridbc.id]
}