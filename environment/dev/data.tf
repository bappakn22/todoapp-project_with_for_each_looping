data "azurerm_public_ip" "pub_ip" {
  depends_on = [module.pip  ]
  name                =    "todo_pip"
  resource_group_name = local.rg_names
}

data "azurerm_subnet" "bashost" {
  depends_on = [ module.mysubnet ]
  name                 = "AzureBastionSubnet"
  virtual_network_name = "todo-vnet"
  resource_group_name  = "todo_rg"
}

output "subnet_id" {
  value = data.azurerm_subnet.bashost.id
}