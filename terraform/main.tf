provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "vm" {
  ami           = "ami-08ec94f928cf25a9d" # Amazon Linux 2 AMI
  instance_type = "t3.micro"

  tags = {
    Name = "tf_test_vm1"
  }
}
