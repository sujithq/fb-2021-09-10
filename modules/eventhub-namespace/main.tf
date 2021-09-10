provider "azurerm" {
  features {

  }
}

resource "azurerm_eventhub_namespace" "example" {
  sku                 = var.sku
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

}

variable "name" {
  type        = string
  description = "Namespace Name"
}

variable "sku" {
  type        = string
  description = "Sku"
  default     = "Standard"
}

variable "location" {
  type        = string
  description = "Location"
  default     = "westeurope"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

output "name" {
  value = azurerm_eventhub_namespace.example.name
}