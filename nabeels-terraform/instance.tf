resource "aws_instance" "my-instance" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = "my-first-dm"
  vpc_security_group_ids = ["sg-064c7ab32018974da"]
  subnet_id = "subnet-0ed8b7be60a4541d7" 
  user_data = "${file("apache.sh")}"
