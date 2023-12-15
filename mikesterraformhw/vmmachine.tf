resource "aws_instance" "app_server" {
  ami           = "ami-0e83be366243f524a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Web Security Group for HTTP"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCWoTny81k3oIiHOGKlftS5iskv6m5qdV7b+PLoISkewfa1oVVbpaFfIqEB0lyVp2hENC6GppI60Wi/pgpBOpEC31tZxudANLqBwwhShlx80yZIOD8ZhxlhyY2iBtA+LPRBICQjWMJaVJHoREYNuRxSiEQ2l2jCoQ5lUFesiA6q+Hb5mg+czA8E7NWFySU+yGg8lr8o2aZOVgZUqFMNKUDMX6mCfYWJkdRVh+PEolT+hmAQUqrWkWLscDq780R6l8ynpGm06JYtOX4+qFrcl/1Ee6WngbqlvnL61p1Kwu2jEMTYEP3tNEn+vzm5PCBjJG+Euet0PAc+yLTD40i7zK/t haseebswebserver"
}


