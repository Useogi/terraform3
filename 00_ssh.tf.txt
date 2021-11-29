resource "aws_key_pair" "useogi_key" {
    key_name = "useogi1-key"
    public_key = file("../../.ssh/useogi-key.pub")
}