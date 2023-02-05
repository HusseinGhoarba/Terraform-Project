resource "aws_route_table_association" "route-one" {
  count = length(var.subnet-ip-assoc)
  subnet_id      = var.subnet-ip-assoc[count.index]
  route_table_id = var.table-id-assoc
}