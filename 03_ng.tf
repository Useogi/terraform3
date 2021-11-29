# Nat Gateway
resource "aws_eip" "useogi_ngw_ip" {
    vpc = true
}

resource "aws_nat_gateway" "useogi_ngw" {
    allocation_id = aws_eip.useogi_ngw_ip.id
    subnet_id = aws_subnet.useogi_pub[0].id

    tags = {
        "Name" = "${var.name}-ngw"
    }
}

# Route Table
resource "aws_route_table" "useogi_ngwrt" {
    vpc_id = aws_vpc.useogi_vpc.id

    route {
        cidr_block = var.cidr_route
        gateway_id = aws_nat_gateway.useogi_ngw.id
    }
    
    tags = {
        "Name" = "${var.name}-ngwrt"
    }
}

# Route Table Association
resource "aws_route_table_association" "useogi_ngwass_pri" {
    count = length(var.pri_sub)
    subnet_id = aws_subnet.useogi_pri[count.index].id
    route_table_id = aws_route_table.useogi_ngwrt.id
}

resource "aws_route_table_association" "useogi_ngwass_pridb" {
    count = length(var.pri_subdb)
    subnet_id = aws_subnet.useogi_pridb[count.index].id
    route_table_id = aws_route_table.useogi_ngwrt.id
}
