#-------------------------------General Instances------------------
variable "alb-name" {
  
}

variable "subnets-id" {
  
}

variable "sg-for-lb" {

}

variable "lb-type" {
  
}

variable "deny-check" {
  type = bool
  default = false
}

variable "internal-lb-check" {
  
}

#-------------------------------listners------------------
variable "instances-port" {
  
}

variable "instances-protocol" {
  
}

variable "lisnter-action-type" {
  type = string
  default = "forward"
}

#-------------------------------Health check------------------

variable "healthy-threshold-of-instances" {
  type = number
  default = 2
}

variable "unhealthy-threshold-of-instances" {
  type = number
  default = 2
}


variable "timeout-of-instances" {
  type = number
  default = 3
}

variable "path-of-health-check" {
  type = string
  default = "/"
}

variable "interval-of-health-check" {
  type = number
  default = 30
}

#-------------------------------General Requires ------------------

variable "instances-id" {

}

variable "checking-of-cross-zone-load-balancing" {
  type = bool
  default = true
}

variable "name-tags-of-load-balancer" {

}

#-------------------------------Target Groups------------------

variable "target-grp-name" {
  
}

variable "target-grp-type" {
  
}

variable "vpc-id" {
  
}

variable "dependencies" {
  
}