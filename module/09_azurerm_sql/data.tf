data "azurerm_key_vault" "keyvault" {
  name                = "tijori"
  resource_group_name = "bappa-remotestate-rg"
}

data "azurerm_key_vault_secret" "username" {
  name         = "tijoriname"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "tijoripassword"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}