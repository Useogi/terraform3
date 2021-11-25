resource "aws_eip" "useogi_ngw_ip" {
    vpc = true
}

resource "aws_nat_gateway" "useogi_ngw" {
    allocation_id = aws_eip.useogi_ngw_ip.id
    subnet_id = aws_subnet.useogi_puba.id

    tags = {
        "Name" = "useogi-ngw"
    }
}