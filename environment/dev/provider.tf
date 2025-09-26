terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "bappa-state-rg"
    storage_account_name = "mstatefiles"
    container_name       = "statefiles"
    key                  = "todo.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id

}

