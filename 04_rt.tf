resource "aws_route_table" "useogi_rt" {
    vpc_id = aws_vpc.useogi_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.useogi_ig.id
    }

    tags {
        "Name" = "useogi-rt"
    }
}