#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "= 4.67.0"
#    }
#  }
#
#  backend "local" {
#    path = "./terraform.tfstate"
#  }
#}
#
#
#provider "aws" {
#  region                      = "us-east-1"
#  access_key                  = "test"
#  secret_key                  = "test"
#  s3_use_path_style           = true
#  skip_credentials_validation = true
#  skip_metadata_api_check     = true
#
#  endpoints {
#    s3  = "http://localhost:4566"
#    iam = "http://localhost:4566"
#    ec2 = "http://localhost:4566"
#  }
#}
#
#resource "aws_s3_bucket" "my_bucket" {
#  bucket = "my-localstack-bucket"
#}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.67.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true

  endpoints {
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

# VPC
resource "aws_vpc" "maini" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "todo-vpc"
  }
}

# Subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "todo-subnet"
  }
}

# Security Group
resource "aws_security_group" "todo_sg" {
  name        = "todo-app-sg"
  description = "Allow HTTP and app traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 8291
    to_port     = 8291
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App Port"
    from_port   = 8291
    to_port     = 8291
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "todo-app-sg"
  }
}

# S3 Bucket (for storing Terraform state or other resources)
resource "aws_s3_bucket" "terraform_state" {
  bucket = "todo-app-terraform-state"

  tags = {
    Name = "TerraformState"
  }
}
