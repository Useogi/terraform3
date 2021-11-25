resource "aws_route_table_association" "useogi_igas_puba" {
    subnet_id = aws_subnet.useogi_puba.id
    route_table_id = aws_route_table.useogi_rt.id
}

resource "aws_route_table_association" "useogi_igas_pubc" {
    subnet_id = aws_subnet.useogi_pubc.id
    route_table_id = aws_route_table.useogi_rt.id
}