module "rg" {
  source = "../../module/01_azurerm_rg"
  rgs    = var.rg_details
}

module "v-net" {
  depends_on = [module.rg]
  source     = "../../module/02_azurerm_vnet"
  vnets      = var.vnets
}

module "mysubnet" {
  depends_on = [module.v-net]
  source     = "../../module/03_azurerm_subnet"
  subnets    = var.mysubnets

}

module "pip" {
  depends_on = [module.rg]
  source     = "../../module/04_azurerm_pip"
  public_ip  = var.pip

}


module "bastion" {
  depends_on            = [module.mysubnet, module.rg, module.pip]
  source                = "../../module/05_azurerm_bastion"
  bastion_name          = var.bastion_name
  location              = local.location_name
  resource_group_name   = local.rg_names
  ip_configuration_name = var.ip_configuration_name
  subnet_id             = data.azurerm_subnet.bashost.id
  public_ip_address_id  = data.azurerm_public_ip.pub_ip.id

}

module "my_vm" {
  depends_on            = [module.rg, module.mysubnet]
  source                = "../../module/06_azurerm_vm"
  for_each              = var.vm
  vm_name               = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  nic_name              = each.value.nic_name
  ip_configuration_name = each.value.ip_configuration_name
  publisher             = each.value.publisher
  offer                 = each.value.offer
  sku                   = each.value.sku
  subnet_id             = each.value.subnet_id

}

module "nsg" {
  depends_on          = [module.rg]
  source              = "../../module/07_azurerm_nsg"
  for_each            = var.nsg_details
  nsg_name            = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

}

module "nsga" {
  depends_on                = [module.nsg]
  source                    = "../../module/08_azurerm_nsg_association"
  for_each                  = var.nsga_details
  network_interface_id      = each.value.network_interface_id
  network_security_group_id = each.value.network_security_group_id
}

module "sql" {
  depends_on                   = [module.rg]
  source                       = "../../module/09_azurerm_sql"
  for_each                     = var.sql_servers
  server_name                  = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  database_name                = each.value.database_name
}
