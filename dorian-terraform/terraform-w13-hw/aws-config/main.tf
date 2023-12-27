terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_instance" "import-ec2" {
    ami = "ami-0fc5d935ebf8bc3bc"
    launch_template {
       name    = "basic-ec2-ubuntu"
       version = "1"
    }
}

module "ec2-module" {
  source = "./modules/ec2"

}
module "vpc-module" {
  source = "./modules/vpc"
}
