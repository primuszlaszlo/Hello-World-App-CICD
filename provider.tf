terraform {
  backend "azurerm" {
    resource_group_name  = "cicdtest"        # A backend RG-je
    storage_account_name = "statestorageacc" # A backend Storage Account neve
    container_name       = "tfstate"         # A container neve
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "aabce8b4-895a-41db-b10e-b0127f4eeedf"
}

