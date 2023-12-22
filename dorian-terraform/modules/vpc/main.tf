
# This block defines the resource "aws_vpc" which creates a VPC.

resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnets" {
    # count is used to create multiple subnets based on the number of cidr blocks
    count                  = length(var.public_subnet_cidrs)
    vpc_id                  = aws_vpc.main_vpc.id
    # select the cidr block from the list of cidr blocks
    cidr_block              = element(var.public_subnet_cidrs, count.index)
    availability_zone       = "us-east-1a"
}

resource "aws_network_acl" "my_nacl" {
    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "my_route" {
    route_table_id         = aws_route_table.my_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.my_internet_gateway.id
}

resource "aws_internet_gateway" "my_internet_gateway" {
    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_network_acl_association" "network_nacl_association" {
    subnet_id      = aws_subnet.public_subnets[0].id
    network_acl_id = aws_network_acl.my_nacl.id
}

resource "aws_route_table_association" "my_route_table_association" {
    subnet_id      = aws_subnet.public_subnets[0].id
    route_table_id = aws_route_table.my_route_table.id
}

variable "public_subnet_cidrs"  {
        type = list(string)
        description = "value of cidr blocks for public subnets"
        default =  ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
