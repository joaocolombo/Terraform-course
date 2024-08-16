terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.52.0"
    }
  }

  //https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
  backend "azurerm" {
    resource_group_name  = "colombo-resource-state"     # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "colombostorageaccountst"    # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "remote-state"               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "azure-vm/terraform.tfstate" //<diretorio Opicinal>/terraform.tfstate       # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command. }
  }
}

provider "azurerm" {
  features {}
}

//https://developer.hashicorp.com/terraform/language/settings/backends/azurerm#example-backend-configurations
data "terraform_remote_state" "data-vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "colombo-resource-state"
    storage_account_name = "colombostorageaccountst"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}