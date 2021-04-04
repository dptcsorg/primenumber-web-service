
# Create a Resource Group
resource "azurerm_resource_group" "appservice-rg" {
  name     = "deep-${var.region}-${var.environment}-${var.app_name}-app-service-rg"
  location = var.location

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tstates"
    storage_account_name = "primenumber091"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}

# Create the App Service Plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "deep-${var.region}-${var.environment}-${var.app_name}-service-plan"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}

# Create the App Service
resource "azurerm_app_service" "app-service" {
  name                = "deep-${var.region}-${var.environment}-${var.app_name}-app-service"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  site_config {
    linux_fx_version = "DOCKER|deepaksisupal/primenumber-web-service:latest"
  }
  app_settings = {
    "WEBSITES_PORT" = "8080"
  }

  tags = {
    description = var.description
    environment = var.environment
    owner       = var.owner
  }
}
