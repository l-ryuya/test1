terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# リージョン指定
provider "aws" {
  region = var.aws_region
}