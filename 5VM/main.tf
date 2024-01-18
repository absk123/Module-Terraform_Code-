resource "azurerm_linux_virtual_machine" "main" {
  for_each                        = var.vms
  name                            = each.value.name
  resource_group_name             = data.azurerm_resource_group.datarg.name
  location                        = data.azurerm_resource_group.datarg.location
  size                            = "Standard_D1_v2"
  admin_username                  = each.value.user
  admin_password                  = data.azurerm_key_vault_secret.datakey.value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.datani[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
