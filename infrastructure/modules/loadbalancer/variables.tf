
variable "vpc_id" {
  description = "Id of vpc"
  type        = string
}

variable "lb_tg_name" {
  description = "Loadbalancer target group name"
  type        = string
}

variable "instance_ids" {
  description = "ID of instance"
  type        = list(string)
}

variable "lb_name" {
  description = "Loadbalancer name"
  type        = string
}

variable "lb_sg_ids" {
  description = "Security group ids for loadbalancer"
  type        = list(string)
}

variable "subnets" {
  type = list(string)
}
