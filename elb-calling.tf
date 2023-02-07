module "public-load-balancer" {
  source = "./alb-template"
  #Elastic-Load-Balancer-of-type-ALB------------------------------
  #------General Requires 1------
  alb-name = var.name-of-the-pub-lb
  subnets-id = [module.public-subnet.first-sub,module.public-subnet.second-sub]
  sg-for-lb = [module.security-grps.public-sg-id-for-alb]
  lb-type = var.type-of-load-balancer
  internal-lb-check = var.internal-check-of-alb-pub
  name-tags-of-load-balancer = var.name-of-pub-alb-in-tags
  #---------------------------------------------------------------------------------------------------------
  #Tareget-Group-Definition-------------------------------------------
  target-grp-name = var.target-grp-pub
  target-grp-type = var.type-of-target-grp
  vpc-id = module.vpc-igw.vpc1-id
  #------listners------
  instances-port = var.port-of-instance-alb-listners
  instances-protocol = var.protocol-of-instance-alb-listners
  #Health Check of the target group will be from default of the module
  #---------------------------------------------------------------------------------------------------------
  #Attach-Instances-to-Previous Target Group-------------------
  instances-id = [module.pub-instance2.id-instance-public,module.pub-instance1.id-instance-public]
  dependencies = module.pub-instance2
  #---------------------------------------------------------------------------------------------------------
  #Attach-Previous Target Group-To-ALB-Listners-------------------
  lisnter-action-type = var.action-of-load-balancer-listner
}

module "private-load-balancer" {
  source = "./alb-template"
  #Elastic-Load-Balancer-of-type-ALB------------------------------
  #------General Requires 1------
  alb-name = var.name-of-the-priv-lb
  subnets-id = [module.private-subnet.first-sub,module.private-subnet.second-sub]
  sg-for-lb = [module.security-grps.private-sg-id-for-alb]
  lb-type = var.type-of-load-balancer
  internal-lb-check = var.internal-check-of-alb-prv
  name-tags-of-load-balancer = var.name-of-priv-alb-in-tags
  #---------------------------------------------------------------------------------------------------------
  #Tareget-Group-Definition-------------------------------------------
  target-grp-name = var.target-grp-prv
  target-grp-type = var.type-of-target-grp
  vpc-id = module.vpc-igw.vpc1-id
  #------listners------
  instances-port = var.port-of-instance-alb-listners
  instances-protocol = var.protocol-of-instance-alb-listners
  #Health Check of the target group will be from default of the module
  #---------------------------------------------------------------------------------------------------------
  #Attach-Instances-to-Previous Target Group-------------------
  instances-id = [module.prv-instance1.id-private,module.prv-instance2.id-private]
  dependencies = module.prv-instance2
  #---------------------------------------------------------------------------------------------------------
  #Attach-Previous Target Group-To-ALB-Listners-------------------
  lisnter-action-type = var.action-of-load-balancer-listner
}