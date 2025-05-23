#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 5.98.0"
#    }
#  }
#
#  required_version = ">= 1.0.0"
#}
#
#provider "aws" {
#  access_key = "test"
#  secret_key = "test"
#  region     = "us-east-1"
#
#  endpoints {
#    ec2        = "http://localhost:4566"
#    s3         = "http://localhost:4566"
#    iam        = "http://localhost:4566"
#    sts        = "http://localhost:4566"
#    cloudwatch = "http://localhost:4566"
#    dynamodb   = "http://localhost:4566"
#  }
#
#  skip_credentials_validation = true
#  skip_metadata_api_check     = true
#  skip_requesting_account_id  = true
#  insecure                    = true
#}
#
##resource "aws_s3_bucket" "test-bucket" {
##  bucket = "my-bucket"
##}
#
##resource "aws_vpc" "main" {
##  cidr_block = "10.0.0.0/16"
##}
##
#
#
##iam/main.tf
#resource "aws_iam_role" "eks_role" {
#  name = "eks-role"
#  assume_role_policy = jsonencode({
#    Version = "2012-10-17",
#    Statement = [{
#      Effect = "Allow",
#      Principal = {
#        Service = "ec2.amazonaws.com"
#      },
#      Action = "sts:AssumeRole"
#    }]
#  })
#}
#
#
##vpc/main.tf
#resource "aws_vpc" "main" {
#  cidr_block           = "10.0.0.0/16"
#  enable_dns_support   = true
#  enable_dns_hostnames = true
#  tags = {
#    Name = "main-vpc"
#  }
#}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_iam_role" "eks_role" {
  name = "eks-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

#resource "random_id" "bucket_suffix" {
#  byte_length = 4
#}
#
#resource "aws_s3_bucket" "test_bucket" {
#  bucket        = "my-bucket-${random_id.bucket_suffix.hex}"
#  force_destroy = false
#}
#
#resource "aws_s3_bucket" "tf_state" {
#  bucket        = "terraform-state-bucket-${random_id.bucket_suffix.hex}"
#  force_destroy = true
#}
