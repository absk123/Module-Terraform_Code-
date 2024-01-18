resource "azurerm_public_ip" "main" {
  for_each            = toset(var.ip)
  name                = each.value
  resource_group_name = data.azurerm_resource_group.datarg.name
  location            = data.azurerm_resource_group.datarg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}
