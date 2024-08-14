terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.115.0"
    }
  }
  backend "s3" {
    bucket = "colombo-bucket-remote-state" //nome da bucket criada no passo anterior
    key    = "aws-vm/terraform.tfstate"    //aonde vai ficar o state da VM
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      owner      = "colombo"
      managed-by = "terraform"
    }
  }
}

//https://developer.hashicorp.com/terraform/language/settings/backends/s3#data-source-configuration
//adicionar recusos dentro da mesma vpc
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "colombo-bucket-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}