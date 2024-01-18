resource "azurerm_virtual_network" "main" {
  for_each = var.vn
  name                = each.value.vname
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name
  address_space       = each.value.add

  dynamic "subnet" {
    for_each = var.sn
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.ad
    }
  }
}