output "dns-of-alb-prv" {
  value = aws_lb.elb-alb.dns_name
}