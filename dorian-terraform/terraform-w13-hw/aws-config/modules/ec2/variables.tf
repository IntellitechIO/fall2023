variable "instance_type" {
    description = "The type of EC2 instance"
    type        = string
    default     = "t2.micro"
}

variable instance_ami {
    type = string
    description = "Server image to use"
    default = "ami-0fc5d935ebf8bc3bc"
}

variable "key_name"{
    description = "The key name for ec2"
    type        = string
    default     = "general-ec2"
}

variable "my_ip_cidr" {
  description = "CIDR block for SSH access"
  type        = string
  default     = "71.172.197.159/32"
}

variable instance_root_device_size {
    type = number
    description = "Root bock device size in GB"
    default = 8
}