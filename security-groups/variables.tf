#-------------------------General -EC2- Security Group Variables--------------------------------#

variable "vpc-cidr-block-id" {
}
variable "http-port" {
}
variable "ssh-port" {
}
variable "all-traffic-port" {
}
variable "protocol-tcp" {
}
variable "public-ip-add-sg" {
  type = list
}
variable "all-traffic-protocol" {  
}

#==========================================================================================#

#-------------------------Public -EC2- Security Group Variables--------------------------------#

variable "public-sg-name" {
}
variable "public-sg-description" {  
}
variable "sg-public-name-tags" {  
}

#==========================================================================================#

#-------------------------Private -EC2- Security Group Variables--------------------------------#

variable "private-sg-name" {  
}
variable "private-sg-description" {  
}
variable "sg-private-name-tags" {  
}

#==========================================================================================#

#-------------------------Public -ALB- Security Group Variables--------------------------------#

variable "public-sg-alb-name" {  
}
variable "public-sg-description-alb" {  
}
variable "sg-public-name-tags-alb" {
}
#==========================================================================================#

#-------------------------Private -ALB- Security Group Variables--------------------------------#

variable "private-sg-alb-name" {  
}
variable "private-sg-description-alb" {  
}
variable "sg-private-name-tags-alb" {
}
#==========================================================================================#




