terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAVJSZB6R4676XJIF3"
  secret_key = "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"
}

