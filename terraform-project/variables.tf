variable "aws_region" {
  description = "Region to deploy the infrastructure"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "public_route_table_name" {
  description = "Name of the public route table"
  default     = "public_route_table"
}

variable "internet_gateway_name" {
  description = "Name of the internet gateway"
  default     = "main_igw"
}
