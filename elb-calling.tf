module "public-load-balancer" {
  source = "./alb-public"
  #------General Requires 1------
  alb-name = var.name-of-the-pub-lb
  subnets-id = [module.public-subnet.first-sub,module.public-subnet.second-sub]
  sg-for-lb = [module.security-grps.public-sg-id-for-alb]
  #------listners------
  instances-port = var.port-of-instance-alb-listners
  instances-protocol = var.protocol-of-instance-alb-listners
  load-balancer-port = var.port-of-alb-listners
  load-balancer-protocol = var.protocol-of-alb-listners
  #-------Health Check-----
  #-->already will be token with the default value of the health check that has been defined in variables of the module
  instances-id = [module.pub-instance1.id-instance-public,module.pub-instance2.id-instance-public]
  #other values like idle-timeout/connection draining/cross-zone-load-balancer ...... will be token by default value from variables in the module
  name-tags-of-load-balancer = var.name-of-pub-alb-in-tags
}
