resource "aws_route_table_association" "useogi_ngwass_pria" {
    subnet_id = aws_subnet.useogi_pria.id
    route_table_id = aws_route_table.useogi_ngwrt.id
}

resource "aws_route_table_association" "useogi_ngwass_pric" {
    subnet_id = aws_subnet.useogi_pric.id
    route_table_id = aws_route_table.useogi_ngwrt.id
}

resource "aws_route_table_association" "useogi_ngwass_pridba" {
    subnet_id = aws_subnet.useogi_pridba.id
    route_table_id = aws_route_table.useogi_ngwrt.id
}

resource "aws_route_table_association" "useogi_ngwass_pridbc" {
    subnet_id = aws_subnet.useogi_pridbc.id
    route_table_id = aws_route_table.useogi_ngwrt.id
}