# a - public subnet
resource "aws_subnet" "useogi_puba" {
    vpc_id = aws_vpc.useogi_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "useogi_puba"
    }
}
# c - public subnet
resource "aws_subnet" "useogi_pubc" {
    vpc_id = aws_vpc.useogi_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "useogi_pubc"
    }
}
# a - private subnet
resource "aws_subnet" "useogi_pria" {
    vpc_id = aws_vpc.useogi_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "useogi_pria"
    }
}
# c - private subnet
resource "aws_subnet" "useogi_pric" {
    vpc_id = aws_vpc.useogi_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "useogi_pric"
    }
}
# a - private db subnet
resource "aws_subnet" "useogi_pridba" {
    vpc_id = aws_vpc.useogi_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "useogi_pridba"
    }
}
# c - private db subnet
resource "aws_subnet" "useogi_pridbc" {
    vpc_id = aws_vpc.useogi_vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "useogi_pridbc"
    }
}