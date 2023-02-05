resource "aws_route_table" "public-tb" {
  vpc_id = var.cidr-of-vpc

  route {
    cidr_block = var.pub-ip
    gateway_id = var.ip-of-igw
  } 
  
  tags = {
    Name = var.public-route-tb-name
  }
}

resource "aws_route_table" "private-tb" {
  vpc_id = var.cidr-of-vpc

  route {
    cidr_block = var.pub-ip
    nat_gateway_id = var.ip-of-nat-igw
  } 
  
  tags = {
    Name = var.private-route-tb-name
  }
}