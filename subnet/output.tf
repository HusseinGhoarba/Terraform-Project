output "first-sub" {
  value = aws_subnet.my-subnets-hussein[0].id
}

output "second-sub" {
  value = aws_subnet.my-subnets-hussein[1].id
}