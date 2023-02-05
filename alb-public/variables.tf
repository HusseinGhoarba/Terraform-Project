#-------------------------------General Instances------------------
variable "alb-name" {
  
}

variable "subnets-id" {
  
}

variable "sg-for-lb" {

}

#-------------------------------listners------------------
variable "instances-port" {
  
}


variable "instances-protocol" {
  
}

variable "load-balancer-port" {
  
}

variable "load-balancer-protocol" {
  
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

variable "target-of-health-check" {
  type = string
  default = "HTTP:8000/"
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

variable "idle-timeout-of-load-balancer" {
  type = number
  default = 400
}

variable "checking-of-connection-draining" {
  type = bool
  default = true
}

variable "connection-draining-timeout-of-load-balancer" {
  type = number
  default = 400
}

variable "name-tags-of-load-balancer" {

}