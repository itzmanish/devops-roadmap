variable "bastion_instance_name" {
  description = "Name of bastion instance."
  type        = string
}

variable "service_instance_name" {
  description = "Name of service instance."
  type        = string
}

variable "instance_type" {
  description = "Type of instance. Default: t2-micro"
  type        = string
  default     = "t2-micro"
}

variable "ami_id" {
  description = "AMI id of image"
  type        = string
}

variable "public_subnet_ids" {
  description = "list of public subnet ids"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet ids."
  type        = list(string)
}

variable "public_security_groups" {
  description = "List of security groups for public instances."
  type        = list(string)
}

variable "private_security_groups" {
  description = "List of security groups for private instances."
  type        = list(string)
}

variable "bastion_host_count" {
  description = "No. of bastion instance to provision."
  type        = number
}

variable "service_host_count" {
  description = "No. of service instance to provision."
  type        = number
}

variable "extra_storage_azs" {
  description = "AZs for provisioning extra storages"
  type        = list(string)
}

variable "key_name" {
  description = "Instance ssh key name."
  type        = string
}
