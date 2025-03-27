# Final Exam

We need to set up Terraform to create VMs in Azure and AWS.

Requirements:

**For Azure**
- Install Az CLi;
- Create .tf files: main.tf, outputs.tf, providers.tf, ssh.tf, variables.tf;
- Login with the command _az login_;
- Use _terraform init_ and then check if there are any errors with _terraform plan_ command;

Specifications:
- Use variables
- Create _Virtual Network_
- Create _Subnet_
- Create _Public IPs_
- Create _Network Security Group and rule_
- Create _Network Interface_
- Create _A connection between security group and the network interface_
- Create _ID generating when a new resource group is defined_
- Create _storage account for boot diagnostics_
- Specifications for the VM


**For AWS**
- Install AWS Cli;
- Create .tf files: main.tf, outputs.tf, variables.tf, local.tf, terraform.tfvars;
- Login with the command _aws configure_;
- Use _terraform init_ and then check if there are any errors with _terraform plan_ command;

Specifications:
- Name the _VPC_ resource
- Create _Subnets - public and private_
- Create _Internet Gateway_
- Create _Route Table_
- Create _Security Groups_
- Specifications for the VM







-----------------------------------------------------------------------------
MODEL
A short description of your project, what it does, and why it's useful.

---

## Table of Contents

- [About](#about)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## About

Provide a more detailed description of your project here. You can include:

- The main goal of the project
- Technologies used
- Key features
- Screenshots (if applicable)

---

## Installation

### Prerequisites

- List any software or tools required to run the project (e.g., Node.js, Python, etc.)

### Steps

1. Clone the repository
   ```bash
   git clone https://github.com/your-username/project-name.git

