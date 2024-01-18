data "azurerm_resource_group" "datarg" {
  name = "Resoure_Group"
}

data "azurerm_public_ip" "dataip" {
  name                = "LB_Public_IP"
  resource_group_name = data.azurerm_resource_group.datarg.name
}

data "azurerm_virtual_network" "datavn" {
  name                = "Virtual_Network"
  resource_group_name = data.azurerm_resource_group.datarg.name
}

data "azurerm_virtual_machine" "datavm" {
  for_each = var.blip
  name                = each.value.vm
  resource_group_name = data.azurerm_resource_group.datarg.name
}