resource "aws_vpc" "mikesvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "mikesvpc" {
  vpc_id     = aws_vpc.mikesvpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_route_table" "mikesvpc" {
  vpc_id = aws_vpc.mikesvpc.id
 
  route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.mikesvpc.id
}
}

resource "aws_internet_gateway" "mikesvpc" {
  vpc_id = aws_vpc.mikesvpc.id
}


