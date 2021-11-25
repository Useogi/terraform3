resource "aws_route_table" "useogi_ngwrt" {
    vpc_id = aws_vpc.useogi_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.useogi_ngw.id
    }
    
    tags = {
        "Name" = "useogi_ngwrt"
    }
}