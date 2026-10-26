terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.10.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-ayansh"
    storage_account_name = "staccountayansh"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
} 