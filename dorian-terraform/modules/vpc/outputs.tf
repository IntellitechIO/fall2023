output "vpc_id" {
    value = aws_vpc.main_vpc.id
}

output "vpc_cidr_block" {
    value = aws_vpc.main_vpc.cidr_block
}

output "vpc_main_route_table_id" {
    value = aws_vpc.main_vpc.main_route_table_id
}

output "vpc_default_network_acl_id" {
    value = aws_vpc.main_vpc.default_network_acl_id
}
output "public_subnets"{
    value = aws_subnet.public_subnets[*].id
}