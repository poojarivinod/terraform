terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.7.0"
    }
  }
  backend "s3" { #s3 terraform backend
    bucket = "terraform-tf-remote-state"
    key    = "learning-terraform-remote-file" #you should have unique keys with in the buckets, same key should not used in other repos or tf project
    region = "us-east-1"
    dynamodb_table = "state-locking" # dynamodb_table terraform --> spacelift
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}