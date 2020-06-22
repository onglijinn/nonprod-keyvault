provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-nonprod-tfstate-rg1"
    storage_account_name  = "keyvaultnonprodtfstate1"
    container_name        = "keyvault-nonprod-tfstate1"
    key                   = "terraform.tfstate1"
  }
}