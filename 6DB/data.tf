data "azurerm_resource_group" "datarg" {
  name = "Resoure_Group"
}

data "azurerm_key_vault_secret" "datakey" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.datakv.id
}

data "azurerm_key_vault" "datakv" {
  name                = "azureekeyyvaultt"
  resource_group_name = data.azurerm_resource_group.datarg.name
}