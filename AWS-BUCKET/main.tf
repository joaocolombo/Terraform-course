
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1" #colocar sa-east-1 para a região de São Paulo

  default_tags {
    tags = {
      owner       = "colombo"
      environment = "dev"
      managed_by  = "terraform"
    }
  }
}