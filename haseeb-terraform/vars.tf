variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-0e83be366243f524a"
    us-east-1 = "ami-0230bd60aa48260c6"
  }
}

