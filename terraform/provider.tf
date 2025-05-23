## provider.tf
#
#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 4.67.0"
#    }
#    kubernetes = {
#      source  = "hashicorp/kubernetes"
#      version = "~> 2.0"
#    }
#  }
#}
#
##0provider "aws" {
##  region                      = "us-east-1"
##  access_key                  = "test"
##  secret_key                  = "test"
###  s3_force_path_style         = true
##  skip_credentials_validation = true
##  skip_metadata_api_check     = true
##  endpoints {
##    ec2       = "http://localhost:4566"
###    iam       = "http://localhost:4566"
##    sts       = "http://localhost:4566"
##    s3        = "http://localhost:4566"
##    dynamodb  = "http://localhost:4566"
##    # Add other services as needed
##  }
##}
#
#
#provider "aws" {
#  region                      = "us-east-1"
#  access_key                  = "test"
#  secret_key                  = "test"
#  s3_force_path_style         = true
#  skip_credentials_validation = true
#  skip_metadata_api_check     = true
#  skip_requesting_account_id  = true
#
#  endpoints {
#    s3             = "http://localhost:4566"
#    dynamodb       = "http://localhost:4566"
#    iam            = "http://localhost:4566"
#    lambda         = "http://localhost:4566"
#    sts            = "http://localhost:4566"
#  }
#}
#
#provider "kubernetes" {
#  config_path    = "~/.kube/config"
#  config_context = "minikube"


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}


provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    apigateway     = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    kms            = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}
