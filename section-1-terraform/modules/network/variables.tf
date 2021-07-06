variable "namespace" {
  description = "Namespace for vpc"
  type        = string
}

variable "vpc_cidr" {
  description = "cidr block for vpc"
  type        = string
  default     = "172.35.0.0/16"
}

variable "public_subnet_count" {
  description = "Total number of public subnet to provision"
  type        = number
  default     = 1
}

variable "private_subnet_count" {
  description = "Total number of private subnet to provision"
  type        = number
  default     = 1
}

variable "azs" {
  description = "Availablity zones"
  type        = list(string)
}

