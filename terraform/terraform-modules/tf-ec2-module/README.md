
Project steps:
1. Set Up Terraform:
• Install Terraform on your local machine or use a cloud-based development environment.
sudo apt install terraform
• Configure Terraform to authenticate with AWS using environment variables or IAM roles.
aws configure

2. Infrastructure Requirements:
• VPC: Create a VPC with a custom CIDR block (e.g., 10.0.0.0/16).
• Subnets: Create two subnets within the VPC (e.g., one public and one private).
• Route Table: Define a route table and associate it with the public subnet. Add a default route to the internet.
• Internet Gateway: Attach an internet gateway to the VPC for internet connectivity.
• Security Group: Security Group allowing HTTP connection from outside.

3. We create the above resources using main.tf and variables.tf files. 
We create an outputs.tf file to get information about created resources and we format the Terraform files using terraform fmt.

4. Deploy Infrastructure:
• Run the following Terraform commands:
-  terraform init to initialize the working directory.
- terraform plan to review the execution plan.
- terraform apply to deploy the infrastructure.

5.   Validate the Deployment:
• Verify the VPC and its components in the AWS Management Console.
• Confirm that the public subnet has internet access.
 




