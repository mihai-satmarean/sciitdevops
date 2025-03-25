provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

resource "aws_instance" "k3s_vm" {
  ami           = "ami-xxxxxxxx"  # Use a valid Ubuntu or other AMI in your region
  instance_type = "t2.medium"  # Modify based on your needs
  key_name      = "your-ssh-key"  # Use your AWS SSH key name

  # Security Groups for networking access
  security_groups = ["your-security-group"]

  tags = {
    Name = "k3s-node"
  }
}

output "instance_ip" {
  value = aws_instance.k3s_vm.public_ip
}
