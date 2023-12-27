module "vpc-module" {
  source = "../vpc"
}
resource "aws_instance" "app_server" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2-security-group.id]
  key_name               = var.key_name

  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }

  subnet_id = module.vpc-module.public_subnets[0]
  tags = {
    Name = "terraform-ec2"
  }
}

resource "aws_security_group" "ec2-security-group" {
    name        = "terraform-security-group"
    description = "Security group made by terraform"
    vpc_id = module.vpc-module.vpc_id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.my_ip_cidr]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform-security-group"
    }
}
