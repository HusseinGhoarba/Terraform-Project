resource "aws_eip" "elastic-ip-hussein" {
  vpc = true
}

resource "aws_nat_gateway" "hussein-nat" {
  allocation_id = aws_eip.elastic-ip-hussein.id
  subnet_id     = var.subnet-id-of-pub

  tags = {
    Name = var.nat-gateway-name
  }
  depends_on = [var.igw-depends]
}
