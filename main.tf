terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

# Configure the AWS provider

provider "aws" {
  region = "us-east-1"
}



resource "aws_security_group" "ansible_access" {
  name        = "ansible-lab-sg"
  description = "Created by Terraform for SSH Access"
  
  
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

output "ansible_inventory" {
  value = aws_instance.ansible_inventory
}

output "Ansible_controlnode" {
  value = aws_instance.Ansible_controlnode
}


