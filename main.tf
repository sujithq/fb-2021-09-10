provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "example" {
  name     = "rg-eventhub"
  location = "westeurope"
}

module "eventhub-ns-example" {
  source              = "./modules/eventhub-namespace"
  sku                 = "Standard"
  name                = "ehns-example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

module "eventhub-example-1" {
  source              = "./modules/eventhub"
  name                = "eh-example1"
  resource_group_name = azurerm_resource_group.example.name
  namespace_name      = module.eventhub-ns-example.name
}

module "eventhub-example-2" {
  source              = "./modules/eventhub"
  name                = "eh-example2"
  resource_group_name = azurerm_resource_group.example.name
  namespace_name      = module.eventhub-ns-example.name
}