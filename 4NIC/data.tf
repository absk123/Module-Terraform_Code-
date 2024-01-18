data "azurerm_resource_group" "datarg" {
  name = "Resoure_Group"
}

data "azurerm_subnet" "datasn" {
    for_each = var.ni
  name                 = each.value.sname
  virtual_network_name = "Virtual_Network"
  resource_group_name  = data.azurerm_resource_group.datarg.name
}
