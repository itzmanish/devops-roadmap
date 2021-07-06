variable "namespace" {
  description = "Namespace for rds database"
  type        = string
  default     = "default-tf"
}

variable "db_name" {
  description = "Name of databse"
  type        = string
  default     = "default"
}

variable "db_user" {
  description = "Username of databse"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password of databse"
  type        = string
  sensitive   = true
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

variable "subnet_ids" {
  description = "Ids of subnet"
  type        = list(string)
}

variable "rds_sg_ids" {
  description = "Ids of security groups"
  type        = list(string)
}
