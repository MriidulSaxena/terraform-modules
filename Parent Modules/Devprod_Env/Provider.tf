terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "a7275015-536e-4c99-8431-5c9bfbc026c9"
    }