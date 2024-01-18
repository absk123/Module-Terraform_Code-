data "azurerm_resource_group" "datarg" {
  name = "Resoure_Group"
}

data "azurerm_subnet" "datasn" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "Virtual_Network"
  resource_group_name  = "Resoure_Group"
}

data "azurerm_public_ip" "dataip" {
  name                = "BASTION_IP"
  resource_group_name = data.azurerm_resource_group.datarg.name
}