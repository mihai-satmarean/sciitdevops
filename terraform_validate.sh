#!/bin/bash

# Check if Terraform is installed
if ! command -v terraform &> /dev/null
then
    echo "Terraform is not installed. PLease install it!"
    exit 1
fi

# Check the syntax of Terraform files
terraform fmt -check
if [ $? -ne 0 ]; then
    echo "Terraform files are not correctly formatted!"
    exit 1
else
    echo "Terraform files are correctly formatted!"
fi

# Run terraform validate to check the .tf files in the current directory
terraform validate
if [ $? -eq 0 ]; then
    echo "Terraform files are valid!"
else
    echo "Terraform files contain syntax errors!"
    exit 1
fi
