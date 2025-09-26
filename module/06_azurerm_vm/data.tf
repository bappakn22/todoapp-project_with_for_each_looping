data "azurerm_key_vault" "keyvault" {
  name                = "mtijori"
  resource_group_name = "bappa-state-rg"
}

data "azurerm_key_vault_secret" "username" {
  name         = "tuser"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "tpass"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

