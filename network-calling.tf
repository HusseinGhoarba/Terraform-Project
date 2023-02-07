module "vpc-igw" {
  source = "./vpc-igw"  
  cidr-vpc = var.vpc-cidrblock
  name-vpc = var.vpc-main-name
  name-gateway = var.gateway-main-name
}

module "public-subnet" {
  source = "./subnet"
  vpc-cidr-block = module.vpc-igw.vpc1-id
  subnet-cidr-blocks = var.public-subnet-cidr-blocks
  name-subnet = var.subnet-public-name
  az-subnet = ["us-east-2a","us-east-2b"]
}

module "private-subnet" {
  source = "./subnet"
  vpc-cidr-block = module.vpc-igw.vpc1-id
  subnet-cidr-blocks = var.private-subnet-cidr-blocks
  name-subnet = var.subnet-private-name
  az-subnet = ["us-east-2a","us-east-2b"]
}

module "nat-gateway" {
  source = "./natgateway"
  subnet-id-of-pub = module.public-subnet.first-sub
  nat-gateway-name = var.nat-gateway-main-name
  igw-depends = module.vpc-igw.igw1-id
}

module "route-tables" {
  source = "./route-tables"
  cidr-of-vpc = module.vpc-igw.vpc1-id
  pub-ip = var.public-ip-add
  ip-of-igw = module.vpc-igw.igw1-id
  public-route-tb-name = var.public-tb-main-name
  ip-of-nat-igw = module.nat-gateway.nat1-id
  private-route-tb-name = var.private-tb-main-name
}

module "route-association-public" {
  source = "./route-associations"
  subnet-ip-assoc = [module.public-subnet.first-sub,module.public-subnet.second-sub]
  table-id-assoc =  module.route-tables.public-tb-id
}

module "route-association-private" {
  source = "./route-associations"
  subnet-ip-assoc = [module.private-subnet.first-sub,module.private-subnet.second-sub]
  table-id-assoc =  module.route-tables.private-tb-id
}
