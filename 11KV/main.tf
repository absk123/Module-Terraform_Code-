resource "azurerm_key_vault" "main" {
    for_each = var.kv
  name                        = each.value.name
  location                    = data.azurerm_resource_group.datarg.location
  resource_group_name         = data.azurerm_resource_group.datarg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.tenant_id

    key_permissions = ["Get",]

    secret_permissions = [    "Get", "List" , "Set", "Delete", "Recover", "Backup", "Restore"   ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "main" {
    for_each = var.kv
  name         = each.value.pwd
  value        = each.value.password
  key_vault_id = azurerm_key_vault.main[each.key].id
}
