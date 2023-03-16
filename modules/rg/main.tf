resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.resource_tags
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
