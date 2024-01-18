resource "azurerm_bastion_host" "main" {
  name                = var.bh
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasn.id
    public_ip_address_id = data.azurerm_public_ip.dataip.id
  }
}

