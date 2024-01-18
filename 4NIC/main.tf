resource "azurerm_network_interface" "main" {
    for_each = var.ni
  name                = each.value.name
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasn[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}