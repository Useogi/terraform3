resource "aws_internet_gateway" "useogi_ig"{
    vpc_id = aws_vpc.useogi_vpc.id

    tags = {
        "Name" = "useogi-ig"
    }
}