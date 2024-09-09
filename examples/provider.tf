terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" { 
  region = "us-east-1" 
}

provider "aws" {
  alias = "us-west-1"
  region = "us-west-1"
}

provider "aws" {
  alias = "sa-east-1"
  region = "sa-east-1"
}

provider "aws" {
  alias = "ca-central-1"
  region = "ca-central-1"
}

provider "aws" {
  alias = "eu-central-1"
  region = "eu-central-1"
}

provider "aws" {
  alias = "eu-west-2"
  region = "eu-west-2"
}

provider "aws" {
  alias = "ap-south-1"
  region = "ap-south-1"
}

provider "aws" {
  alias = "ap-southeast-2"
  region = "ap-southeast-2"
}