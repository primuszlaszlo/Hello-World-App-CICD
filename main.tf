resource "azurerm_resource_group" "rg" {
  name     = "rg-laci-cicd"
  location = "westeurope"
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asplan-laci"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "hello-laci-48291"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
	always_on = false
    application_stack {
      node_version = "24-lts"
    }
  }
}



