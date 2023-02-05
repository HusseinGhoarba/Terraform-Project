output "public-sg-id-for-ec2" {
  value = aws_security_group.sg-public-ec2.id
}

output "private-sg-id-for-ec2" {
  value = aws_security_group.sg-private-ec2.id
}

output "public-sg-id-for-alb" {
  value = aws_security_group.sg-public-alb.id
}

output "private-sg-id-for-alb" {
  value = aws_security_group.sg-private-alb.id
}