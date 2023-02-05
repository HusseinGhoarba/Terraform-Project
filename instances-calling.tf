data "aws_ami" "amazon-os" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

module "pub-instance1" {
  source = "./public-instances"
  ami-id = data.aws_ami.amazon-os.image_id
  type-instance = var.type-of-instance
  id-subnet = module.public-subnet.first-sub
  checking = var.value-of-checks
  instance_key = var.key-pair-name
  conn-type = var.type-of-connect
  instance-user = var.user-of-instance
  path-priv-key = var.private-key-path
  sg-pub-id = [module.security-grps.public-sg-id-for-ec2]
  instance-name-pub = var.name-of-instance-public1
}


module "pub-instance2" {
  source = "./public-instances"
  ami-id = data.aws_ami.amazon-os.image_id
  type-instance = var.type-of-instance
  id-subnet = module.public-subnet.second-sub
  checking = var.value-of-checks
  instance_key = var.key-pair-name
  conn-type = var.type-of-connect
  instance-user = var.user-of-instance
  path-priv-key = var.private-key-path
  sg-pub-id = [module.security-grps.public-sg-id-for-ec2]
  instance-name-pub = var.name-of-instance-public2
}


module "prv-instance1" {
  source = "./private-instances"
  ami-id = data.aws_ami.amazon-os.image_id
  type-instance = var.type-of-instance
  id-subnet = module.private-subnet.first-sub
  sg-priv-id = [module.security-grps.private-sg-id-for-ec2]
  instance-name-priv = var.name-of-instance-private1
}


module "prv-instance2" {
  source = "./private-instances"
  ami-id = data.aws_ami.amazon-os.image_id
  type-instance = var.type-of-instance
  id-subnet = module.private-subnet.second-sub
  sg-priv-id = [module.security-grps.private-sg-id-for-ec2]
  instance-name-priv = var.name-of-instance-private2
}