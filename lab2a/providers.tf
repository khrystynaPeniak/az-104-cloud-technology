terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "3.6.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azuread" {
  tenant_id = var.tenant_id
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}