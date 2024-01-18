data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "datarg" {
  name = "Resoure_Group"
}