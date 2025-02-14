provider "aws" {
  region = "ap-southeast-1"  # Singapore region
}

# Security Group (Allows SSH & HTTP)
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (change this if needed)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Import SSH Public Key
resource "aws_key_pair" "deployer" {
  key_name   = "my-key"
  public_key = file("~/.ssh/my-key.pub")  # Replace with your actual public key path
}

# EC2 Instance
resource "aws_instance" "ubuntu_server" {
  ami           = "ami-04bbf4b2bc58436d6"  # Ubuntu 24.04 LTS (Singapore)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Ubuntu24-EC2"
  }
}

# Elastic IP
resource "aws_eip" "web_ip" {
  instance = aws_instance.ubuntu_server.id
}

# Output Public IP
output "public_ip" {
  value = aws_eip.web_ip.public_ip
}
