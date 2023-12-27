# Output variable definitions
output "public_ip" {
    value = aws_instance.app_server.public_ip
}

output "ec2_tags" {
  value = aws_instance.app_server.tags_all.Name
}
output "ec2_id" {
  value = aws_instance.app_server.id
}