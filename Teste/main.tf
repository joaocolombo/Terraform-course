terraform {
  required_version = ">= 1.3.0" // dependendo do sinal dentro das aspas, ele pode ser maior, menor, maior ou igual, menor ou igual, intervalo....
  
    required_providers {
    //exemplo provider aws
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    //exemplo provider azure
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    
    //pode adicionar quantos providers quiser...
    }

//O nome deve ser s3 para a aws
//exemplo backend aws
backend "s3" {
  bucket = "mybucket"
  key    = "path/to/my/key"
  region = "us-east-1"
  
}

//O nome deve ser azurerm para a azure
//exemplo azure azure
backend "azurerm" {
  resource_group_name   = "myResourceGroup"
  storage_account_name  = "mystorageaccount"
  container_name        = "mycontainer"
  key                   = "path/to/my/key"
}

}
