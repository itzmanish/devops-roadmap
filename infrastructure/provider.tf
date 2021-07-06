
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

  backend "s3" {
    bucket = "devops-roadmap-tf-state"
    key    = "state"
    region = "ap-south-1"
  }

}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"

  default_tags {
    tags = {
      Environment = "${var.env}"
      Owner       = "Manish"
      Project     = "devops-roadmap"
    }
  }
}
