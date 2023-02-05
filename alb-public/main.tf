# Create a new load balancer
resource "aws_elb" "load-balancer" {
  name               = var.alb-name
  availability_zones = var.subnets-id
  security_groups = var.sg-for-lb

  listener {
    instance_port     = var.instances-port
    instance_protocol = var.instances-protocol
    lb_port           = var.load-balancer-port
    lb_protocol       = var.load-balancer-protocol
  }

  health_check {
    healthy_threshold   = var.healthy-threshold-of-instances
    unhealthy_threshold = var.unhealthy-threshold-of-instances
    timeout             = var.timeout-of-instances
    target              = var.target-of-health-check
    interval            = var.interval-of-health-check
  }

  instances                   = var.instances-id
  cross_zone_load_balancing   = var.checking-of-cross-zone-load-balancing
  idle_timeout                = var.idle-timeout-of-load-balancer
  connection_draining         = var.checking-of-connection-draining
  connection_draining_timeout = var.connection-draining-timeout-of-load-balancer

  tags = {
    Name = var.name-tags-of-load-balancer
  }
}