resource "aws_subnet" "my-subnets-hussein" {
  count      = length(var.subnet-cidr-blocks)
  vpc_id     = var.vpc-cidr-block
  cidr_block = var.subnet-cidr-blocks[count.index]

  tags = {
    Name = var.name-subnet
  }
}