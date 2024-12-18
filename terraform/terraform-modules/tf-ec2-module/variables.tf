variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_az" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = "eu-central-1a"
}

variable "private_subnet_az" {
  description = "The availability zone for the private subnet"
  type        = string
  default     = "eu-central-1b"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
}

variable "name" {
  description = "Environment name"
  type        = string
}

variable "extra_tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "private_key_path" {
  description = "Path to the private key file"
  type = string
}
