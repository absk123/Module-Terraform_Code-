resource "azurerm_network_interface_security_group_association" "example" {
  for_each                  = var.assign
  network_interface_id      = data.azurerm_network_interface.datani[each.key].id
  network_security_group_id = data.azurerm_network_security_group.datansg[each.key].id
}

