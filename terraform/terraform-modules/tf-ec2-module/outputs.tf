output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.seb-vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public-subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private-subnet.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.seb-sg.id
}
