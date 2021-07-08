variable "bucket" {
  description = "Name of the bucket"
  type        = string
}

variable "bucket_namespace" {
  description = "Namespace for the s3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning? Default: true"
  type        = bool
  default     = true
}
