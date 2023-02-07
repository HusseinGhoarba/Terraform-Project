resource "aws_lb" "elb-alb" {
  name               = var.alb-name
  internal           = var.internal-lb-check
  load_balancer_type = var.lb-type
  security_groups    = var.sg-for-lb
  subnets            = var.subnets-id

  enable_cross_zone_load_balancing = var.checking-of-cross-zone-load-balancing
  enable_deletion_protection = var.deny-check

  tags = {
    Name = var.name-tags-of-load-balancer
  }
}

resource "aws_lb_target_group" "target-grp" {
   name               = var.target-grp-name
   target_type        = var.target-grp-type
   port               = var.instances-port
   protocol           = var.instances-protocol
   vpc_id             = var.vpc-id
   health_check {
    healthy_threshold   = var.healthy-threshold-of-instances
    interval            = var.interval-of-health-check
    unhealthy_threshold = var.unhealthy-threshold-of-instances
    timeout             = var.timeout-of-instances
    path                = var.path-of-health-check
    port                = var.instances-port
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment_test" {
    count = length(var.instances-id)
    target_group_arn = aws_lb_target_group.target-grp.arn
    target_id        = var.instances-id[count.index]
    port             = var.instances-port
    depends_on = [
      var.dependencies
    ]
}


resource "aws_lb_listener" "lb_listener_http" {
   load_balancer_arn    = aws_lb.elb-alb.arn
   port                 = var.instances-port
   protocol             = var.instances-protocol
   default_action {
    target_group_arn = aws_lb_target_group.target-grp.arn
    type             = var.lisnter-action-type
  }
}