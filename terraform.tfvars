#-------------------------------------------------------VPC 
vpc-cidrblock = "10.0.0.0/16"
vpc-main-name = "Dev-VPC"
#-------------------------------------------------------Internet Gateway
gateway-main-name = "Dev-Gateway"
#-------------------------------------------------------Subnets
public-subnet-cidr-blocks = ["10.0.0.0/24","10.0.2.0/24"]
subnet-public-name = "dev-public-subnet"
private-subnet-cidr-blocks = ["10.0.1.0/24","10.0.4.0/24"]
subnet-private-name = "dev-private-subnet"
#-------------------------------------------------------Nat-Gateway
nat-gateway-main-name = "dev-nat-gateway"
#-------------------------------------------------------Route Tables
public-ip-add = "0.0.0.0/0"
public-tb-main-name = "dev-public-route-tb"
private-tb-main-name = "dev-private-route-tb"
#-------------------------------------------------------Security Groups
#-----------Public EC2 Security Group Variables ------#
public-security-grp-ec2-name = "dev-ec2-public-sg"
public-security-grp-ec2-description = "Allow SSH & HTTP for Public Instances"
name-of-public-sg-ec2 = "dev-public-security-group-EC2"
#-----------Public EC2 Security Group Variables ------#
private-security-grp-ec2-name = "dev-ec2-private-sg"
private-security-grp-ec2-description = "Only Allow SSH To Private Instances & Allow HTTP From SG of Priv-ALB"
name-of-private-sg-ec2 = "dev-private-security-group-EC2"
#-----------General EC2/ALB Security Group Variables ------#
port-of-http = 80
port-of-ssh = 22
tcp-protocol = "tcp"
public-ip-add-list = ["0.0.0.0/0"]
zero-port = 0
all-traf-protocol = "-1"
#-----------Public ALB Security Group Variables ------#
public-security-grp-alb-name = "dev-alb-public-sg"
public-security-grp-alb-description = "Allow HTTP form Public IP addresses"
name-of-public-sg-alb = "dev-public-security-group-ALB"
#-----------Private ALB Security Group Variables ------#
private-security-grp-alb-name = "dev-alb-private-sg"
private-security-grp-alb-description = "Allow HTTP form private Instances"
name-of-private-sg-alb = "dev-private-security-group-ALB"
#-------------------------------------------------------Instances-EC2
#-------------Public Instances------------------
value-of-checks = "true"
key-pair-name = "devops.pem"
type-of-instance = "t2.micro"
type-of-connect = "ssh"
user-of-instance = "ec2-user"
private-key-path = "./devops.pem"
name-of-instance-public1 = "dev-instance-one-public"
name-of-instance-public2 = "dev-instance-two-public"
#-------------Public Instances------------------
name-of-instance-private1 = "dev-instance-one-private"
name-of-instance-private2 = "dev-instance-two-private"
#-------------------------------------------------------Load-Balancer
#---------------Public-load-balancer--------------------
name-of-the-pub-lb = "dev-public-load-balancer"
#-------Listners
port-of-instance-alb-listners = 8000
protocol-of-instance-alb-listners = "http"
port-of-alb-listners = 80
protocol-of-alb-listners = "http"
#--------General Requires
name-of-pub-alb-in-tags = "dev-public-alb"