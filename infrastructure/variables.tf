variable "env" {
  description = "Environment value"
  type        = string
  default     = "dev"
}

variable "namespace" {
  description = "Namespace for this project"
  type        = string
  default     = "devops-roadmap-tf"
}

variable "vpc_cidr_block" {
  description = "CIDR block for vpc."
  type        = string
  default     = "172.36.0.0/16"
}

variable "bastion_instance_count" {
  description = "Total number of bastion instance to provision"
  type        = number
  default     = 1
}

variable "service_instance_count" {
  description = "Total number of service instance to provision"
  type        = number
  default     = 1
}

variable "db_engine" {
  description = "Database engine (mysql, postgres etc.) Default: mysql"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "5.7"
}

variable "db_name" {
  description = "Name of database"
  type        = string
  default     = "default"
}

variable "db_username" {
  description = "Username of database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password of database"
  type        = string
  sensitive   = true
}