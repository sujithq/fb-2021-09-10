provider "azurerm" {
  features {

  }
}

resource "azurerm_eventhub" "example" {
  name                = var.name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  partition_count     = 2
  message_retention   = 1
}

variable "name" {
  type        = string
  description = "Event Hub Name"
}

variable "namespace_name" {
  type        = string
  description = "Event Hub Namespace Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}