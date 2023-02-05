#-------------------------------------------------------VPC 
variable "vpc-cidrblock" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc-main-name" {
  type = string
  default = "Default-vpc"
}
#-------------------------------------------------------Internet Gateway
variable "gateway-main-name" {
  type = string
  default = "default-gateway"
}
#-------------------------------------------------------Subnets
variable "public-subnet-cidr-blocks" {
  type = list
  default = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "subnet-public-name" {
  type = string
  default = "public-subnet"
}

variable "private-subnet-cidr-blocks" {
  type = list
  default = ["10.0.1.0/24","10.0.4.0/24"]
}

variable "subnet-private-name" {
  type = string
  default = "private-subnet"
}
#-------------------------------------------------------Nat-Gateway
variable "nat-gateway-main-name" {
  type = string
  default = "default-Nat-gateway"
}
#-------------------------------------------------------Route Tables
variable "public-ip-add" {
  type = string
  default = "0.0.0.0/0"
}

variable "public-tb-main-name" {
  type = string
  default = "default-public-tb"
}

variable "private-tb-main-name" {
  type = string
  default = "default-private-tb"
}
#-------------------------------------------------------Security Groups
#-----------Public EC2 Security Group Variables ------#
variable "public-security-grp-ec2-name" {
  type = string
  default = "default-public-sg"
}

variable "public-security-grp-ec2-description" {
  type = string
  default = "public-security-grp-ec2"
}

variable "name-of-public-sg-ec2" {
  type = string
  default = "public-sg-ec2"
}
#-----------Private EC2 Security Group Variables ------#
variable "private-security-grp-ec2-name" {
  type = string
  default = "default-private-sg"
}

variable "private-security-grp-ec2-description" {
  type = string
  default = "private-security-grp-ec2"
}

variable "name-of-private-sg-ec2" {
  type = string
  default = "private-sg-ec2"
}

#-----------Public ALB Security Group Variables ------#
variable "public-security-grp-alb-name" {
  type = string
  default = "default-public-sg-alb"
}

variable "public-security-grp-alb-description" {
  type = string
  default = "public-security-grp-alb"
}

variable "name-of-public-sg-alb" {
  type = string
  default = "public-sg-alb"
}
#-----------Private ALB Security Group Variables ------#
variable "private-security-grp-alb-name" {
  type = string
  default = "default-private-sg-alb"
}

variable "private-security-grp-alb-description" {
  type = string
  default = "private-security-grp-alb"
}

variable "name-of-private-sg-alb" {
  type = string
  default = "private-sg-alb"
}

#-----------General EC2-ALB Security Group Variables ------#
variable "port-of-http" {
  type = number
  default = 80
}

variable "port-of-ssh" {
  type = number
  default = 22
}

variable "tcp-protocol" {
  type = string
  default = "tcp"
}

variable "public-ip-add-list" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "zero-port" {
  type = number
  default = 0
}

variable "all-traf-protocol" {
  type = string
  default = "-1"
}

#-------------------------------------------------------Instances-EC2
#-----------Public EC2 ------------------------------#
variable "value-of-checks" {
  
}

variable "key-pair-name" {
  type = string
  default = "devops.pem"
}

variable "type-of-instance" {
  type = string
  default = "t2.micro"
}

variable "type-of-connect" {
  type = string
  default = "ssh"
}

variable "user-of-instance" {
  type = string
  default = "ec2-user"
}

variable "private-key-path" {
  type = string
  default = "./devops.pem"
}

variable "name-of-instance-public1" {
  type = string
  default = "public-instance-one"
}

variable "name-of-instance-public2" {
  type = string
  default = "public-instance-two"
}

#-----------Public EC2 ------------------------------#
variable "name-of-instance-private1" {
  type = string
  default = "public-instance-one"
}
variable "name-of-instance-private2" {
  type = string
  default = "public-instance-two"
}

#-------------------------------------------------------Load-Balancer
#---------------Public-load-balancer--------------------

variable "name-of-the-pub-lb" {
  type = string
  default = "public-elb"
}
#-----------listners
variable "port-of-instance-alb-listners" {
  type = number
  default = 8000
}

variable "protocol-of-instance-alb-listners" {
  type = string
  default = "http"
}

variable "port-of-alb-listners" {
  type = number
  default = 80
}

variable "protocol-of-alb-listners" {
  type = string
  default = "http"
}
#-----------General Requires---

variable "name-of-pub-alb-in-tags" {
  type = string
  default = "pub-alb"
}