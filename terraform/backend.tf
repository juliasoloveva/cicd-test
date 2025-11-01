terraform {
  backend "azurerm" {
    resource_group_name   = "backend-tf"
    storage_account_name  = "backendtfdemoaustriaeast"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }

  required_version = ">= 1.9, < 2.0"
  
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  
  tenant_id       = "XXXXXXX"
  subscription_id = "XXXXXXX"
}