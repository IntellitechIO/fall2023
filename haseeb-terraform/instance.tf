resource "aws_instance" "my-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "my-firstvm"
  vpc_security_group_ids = ["sg-00f46ab85501a30f4"]

}
