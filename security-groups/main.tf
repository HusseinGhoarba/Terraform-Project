#----------------------Public-Security Group-EC2-----------------#
resource "aws_security_group" "sg-public-ec2" {
  name        = var.public-sg-name
  description = var.public-sg-description
  vpc_id      = var.vpc-cidr-block-id
  
  ingress {
    from_port   = var.http-port
    to_port     = var.http-port
    protocol    = var.protocol-tcp
    cidr_blocks = var.public-ip-add-sg
  }

  ingress {
    from_port   = var.ssh-port
    to_port     = var.ssh-port
    protocol    = var.protocol-tcp
    cidr_blocks = var.public-ip-add-sg
  }

  egress {
    from_port   = var.all-traffic-port
    to_port     = var.all-traffic-port
    protocol    = var.all-traffic-protocol
    cidr_blocks = var.public-ip-add-sg
  }
  
  tags = {
    Name = var.sg-public-name-tags
  }
}

#----------------------Public-Security Group-ALB-----------------#

resource "aws_security_group" "sg-public-alb" {
  name        = var.public-sg-alb-name
  description = var.public-sg-description-alb
  vpc_id      = var.vpc-cidr-block-id
  
  ingress {
    from_port   = var.http-port
    to_port     = var.http-port
    protocol    = var.protocol-tcp
    cidr_blocks = var.public-ip-add-sg
  }

  egress {
    from_port   = var.all-traffic-port
    to_port     = var.all-traffic-port
    protocol    = var.all-traffic-protocol
    cidr_blocks = var.public-ip-add-sg
  }
  
  tags = {
    Name = var.sg-private-name-tags-alb
  }
}

#----------------------Private-Security Group-ALB-----------------#

resource "aws_security_group" "sg-private-alb" {
  name        = var.private-sg-alb-name
  description = var.private-sg-description-alb
  vpc_id      = var.vpc-cidr-block-id
  
  ingress {
    from_port   = var.http-port
    to_port     = var.http-port
    protocol    = var.protocol-tcp
    security_groups = ["${aws_security_group.sg-public-ec2.id}"]
  }

  egress {
    from_port   = var.all-traffic-port
    to_port     = var.all-traffic-port
    protocol    = var.all-traffic-protocol
    cidr_blocks = var.public-ip-add-sg
  }
  
  tags = {
    Name = var.sg-private-name-tags-alb
  }
}
#----------------------Private-Security Group-EC2-----------------#

resource "aws_security_group" "sg-private-ec2" {
  name        = var.private-sg-name
  description = var.private-sg-description
  vpc_id      = var.vpc-cidr-block-id
  
  ingress {
    from_port   = var.http-port
    to_port     = var.http-port
    protocol    = var.protocol-tcp
    security_groups = ["${aws_security_group.sg-private-alb.id}"]
  }

  egress {
    from_port   = var.all-traffic-port
    to_port     = var.all-traffic-port
    protocol    = var.all-traffic-protocol
    cidr_blocks = var.public-ip-add-sg
  }
  
  tags = {
    Name = var.sg-private-name-tags
  }
}