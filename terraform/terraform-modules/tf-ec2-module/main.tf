provider "aws" {
  region = var.region
}

resource "aws_vpc" "seb-vpc" {
  cidr_block = var.vpc_cidr
  tags       = merge(local.common_tags, { Name = "seb-vpc" })
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.seb-vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az
  tags                    = merge(local.common_tags, { Name = "public-subnet" })
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.seb-vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az
  tags              = merge(local.common_tags, { Name = "private-subnet" })
}

resource "aws_internet_gateway" "net-igw" {
  vpc_id = aws_vpc.seb-vpc.id
  tags   = merge(local.common_tags, { Name = "net-igw" })
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.seb-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.net-igw.id
  }
  tags = merge(local.common_tags, { Name = "public-rt" })
}

resource "aws_route_table_association" "public-rt" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_security_group" "seb-sg" {
  vpc_id = aws_vpc.seb-vpc.id
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["86.120.230.117/32"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(local.common_tags, { Name = "seb-sg" })
}
#resource "aws_key_pair" "deployer" {
#  key_name   = "seb-key"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCZ+WUUo9np4Lt6SfVRqSyVyNQnPF8D4AU5c0axEvmEmMPE7kTq1Y4IRqHA4BPc+g2YB+6fBQksF6ZRSngyVBGSicqhtHxp1rRrzLr4smvRqaOGcoh8thyRAdm46CpGWol0xun0sXoBL4E2LT9nWABmobvd1bJIaI3qXV8L2sR6YE+5x+AjFLvL3Ydvuc8bZpV89t9EE7PEaFYSA78tsf++Ir2qp0JPolVDByuneoaPvFLIL3g1SOPdWSNW65Rjs+PgF7S+xS8WaOw5T5+w595FTw+9HsENj86C+vREliOWxwkFl84e4uSXg7zyGyRz25u3eIboLCti+kmbF3yuij8FtbNIxOfJ1X/3J8sc/pzJvmX5OUhhbLd1YAhIhcnPWn1hxpHEA6pZp+xXy+G4HRG049cRE51Snmy42pmsZ8NkdZQKtvKRrYiCuxL5BuoRkI/ou21CajoSh/GgKiqmqrMZgsFzMawDwYZk5QOkNpfbjjwT2FRHHh5khTsoh6JsGos= marius@ubuntu-devops"
#}
resource "aws_instance" "web" {
  ami                    = "ami-0084a47cc718c111a" # Ubuntu AMI
  instance_type          = "t2.micro"
  availability_zone      = var.public_subnet_az
  subnet_id = aws_subnet.public-subnet.id
  key_name = "seb"
  vpc_security_group_ids = [aws_security_group.seb-sg.id]
 
  tags = merge(local.common_tags, { Name = "WebServer" })
 
  user_data = file("python_web_server.sh")
}

