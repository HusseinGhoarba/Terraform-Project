data "aws_ami" "amazon-os" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

module "pub-instance1" {
  source = "./public-instances"
  ami-id = data.aws_ami.ubuntu.image_id
  type-instance = var.type-of-instance
  id-subnet = module.public-subnet.first-sub
  checking = var.value-of-checks
  instance_key = var.key-pair-name
  conn-type = var.type-of-connect
  instance-user = var.user-of-instance
  path-priv-key = var.private-key-path
  sg-pub-id = [module.security-grps.public-sg-id-for-ec2]
  instance-name-pub = var.name-of-instance-public1
  prv-alb-dns = module.private-load-balancer.dns-of-alb-prv
  }

module "pub-instance2" {
  source = "./public-instances"
  ami-id = data.aws_ami.ubuntu.image_id
  type-instance = var.type-of-instance
  id-subnet = module.public-subnet.second-sub
  checking = var.value-of-checks
  instance_key = var.key-pair-name
  conn-type = var.type-of-connect
  instance-user = var.user-of-instance
  path-priv-key = var.private-key-path
  sg-pub-id = [module.security-grps.public-sg-id-for-ec2]
  instance-name-pub = var.name-of-instance-public2
  prv-alb-dns = module.private-load-balancer.dns-of-alb-prv
}


module "prv-instance1" {
  source = "./private-instances"
  ami-id = data.aws_ami.amazon-os.image_id
  type-instance = var.type-of-instance
  id-subnet = module.private-subnet.first-sub
  sg-priv-id = [module.security-grps.private-sg-id-for-ec2]
  instance-name-priv = var.name-of-instance-private1
  dependencies = module.nat-gateway
  user-data-inf =  <<EOF
    #!/bin/bash
    # install httpd (Linux Version2)
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y 
    sudo systemctl enable nginx
    sudo systemctl start nginx
    echo "<body>" > /var/www/html/index.html
    echo "<h1 style="text-align:center;">Hello development Teams from $(hostname -f)</h1>" >> /var/www/html/index.html
    echo "<p style="text-align:center;">From: Hussein Ghoraba</p>" >> /var/www/html/index.html
    echo "<p style="text-align:center;">Tagged Version : Private Instance Number One </p> ">> /var/www/html/index.html
    echo "</body>" >> /var/www/html/index.html
    EOF
}


module "prv-instance2" {
  source = "./private-instances"
  ami-id = data.aws_ami.amazon-os.image_id
  type-instance = var.type-of-instance
  id-subnet = module.private-subnet.second-sub
  sg-priv-id = [module.security-grps.private-sg-id-for-ec2]
  instance-name-priv = var.name-of-instance-private2
  dependencies = module.nat-gateway
  user-data-inf =  <<EOF
  #!/bin/bash
  # install httpd (Linux Version2)
  yum update -y
  yum -y install httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<body>" > /var/www/html/index.html
  echo "<h1 style="text-align:center;">Hello development Teams from $(hostname -f)</h1>" >> /var/www/html/index.html
  echo "<p style="text-align:center;">From: Hussein Ghoraba</p>" >> /var/www/html/index.html
  echo "<p style="text-align:center;">Tagged Version : Private Instance Number Two </p> ">> /var/www/html/index.html
  echo "</body>" >> /var/www/html/index.html
  EOF
}