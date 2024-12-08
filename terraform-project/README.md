# Terraform VPC Project

## Description
This project creates the following infrastructure in AWS:
- VPC
- A public subnet and a private subnet
- A Gateway Internet
- A route table for the public subnet
- A security group that allows only HTTTP

## How to run it
1. Install Terraform.
2. Run the commands:
```bash
terraform init
terraform plan
terraform apply
