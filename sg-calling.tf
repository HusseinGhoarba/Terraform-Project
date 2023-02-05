module "security-grps" {
  source = "./security-groups"
  #---------------------------------------------PUBLIC-EC2-SG
  public-sg-name = var.public-security-grp-ec2-name
  public-sg-description = var.public-security-grp-ec2-description
  sg-public-name-tags = var.name-of-public-sg-ec2
  #---------------------------------------------GENERAL-VARIABLES-EC2-ALB
  vpc-cidr-block-id = module.vpc-igw.vpc1-id
  http-port = var.port-of-http
  ssh-port = var.port-of-ssh
  protocol-tcp = var.tcp-protocol
  public-ip-add-sg = var.public-ip-add-list
  all-traffic-port = var.zero-port
  all-traffic-protocol = var.all-traf-protocol
  #---------------------------------------------PRIVATE-EC2-SG
  private-sg-name = var.private-security-grp-ec2-name
  private-sg-description = var.private-security-grp-ec2-description
  sg-private-name-tags = var.name-of-private-sg-ec2
  #---------------------------------------------PUBLIC-ALB-SG
  public-sg-alb-name = var.public-security-grp-alb-name
  public-sg-description-alb = var.public-security-grp-alb-description
  sg-public-name-tags-alb = var.name-of-public-sg-alb
  #---------------------------------------------PRIVATE-ALB-SG
  private-sg-alb-name = var.private-security-grp-alb-name
  private-sg-description-alb = var.private-security-grp-alb-description
  sg-private-name-tags-alb = var.name-of-private-sg-alb
}