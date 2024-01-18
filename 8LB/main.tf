resource "azurerm_lb" "main" {
  name                = var.lb
  location            = data.azurerm_resource_group.datarg.location
  resource_group_name = data.azurerm_resource_group.datarg.name
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.dataip.id
  }
}

resource "azurerm_lb_backend_address_pool" "main" {
  loadbalancer_id = azurerm_lb.main.id
  name            = var.blb
}

resource "azurerm_lb_backend_address_pool_address" "main" {
  for_each = var.blip
  name                    = each.value.name
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
  virtual_network_id      = data.azurerm_virtual_network.datavn.id
  ip_address              = data.azurerm_virtual_machine.datavm[each.key].private_ip_address
}

resource "azurerm_lb_probe" "main" {
  loadbalancer_id = azurerm_lb.main.id
  name            = "http-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.main.id]
  probe_id = azurerm_lb_probe.main.id
}