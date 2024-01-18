resource "azurerm_sql_server" "main" {
  for_each                     = var.db
  name                         = each.value.srver
  resource_group_name          = data.azurerm_resource_group.datarg.name
  location                     = data.azurerm_resource_group.datarg.location
  version                      = "12.0"
  administrator_login          = each.value.user
  administrator_login_password = data.azurerm_key_vault_secret.datakey.value
}

resource "azurerm_sql_database" "main" {
  for_each            = var.db
  name                = each.value.db
  resource_group_name = data.azurerm_resource_group.datarg.name
  location            = data.azurerm_resource_group.datarg.location
  server_name         = azurerm_sql_server.main[each.key].name
}