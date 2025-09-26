rg_details = {
  rg1 = {
    resource_group_name = "todo_rg"
    location            = "eastus"
  }

}

vnets = {
  vnet1 = {
    vnet_name           = "todo_vnet"
    location            = "eastus"
    resource_group_name = "todo_rg"
    address_space       = ["10.0.0.0/16"]
  }
}

mysubnets = {
  frontendsubnet = {
    subnet_name          = "todo_frontendsubnet"
    resource_group_name  = "todo_rg"
    virtual_network_name = "todo_vnet"
    address_prefixes     = ["10.1.0.0/24"]
  }

  backendsubnet = {
    subnet_name          = "todo_backendsubnet"
    resource_group_name  = "todo_rg"
    virtual_network_name = "todo_vnet"
    address_prefixes     = ["10.2.0.0/24"]
  }
bastionsub = {
    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "todo_rg"
    virtual_network_name = "todo-vnet"
    address_prefixes     = ["10.3.0.0/26"]
  }
}

pip = {
  mypip = {
    pip_name            = "todo_pip"
    location            = "east us"
    resource_group_name = "todo_rg"

  }
}

# bastion_subnet = {
  
# }

bastion_name          = "my_bastion"
ip_configuration_name = "bastion_ipconfig"

vm = {
  frontendvm = {
    vm_name               = "frontendvm"
    resource_group_name   = "todo_rg"
    location              = "east us"
    nic_name              = "frendnic"
    ip_configuration_name = "frend_ip_config"
    publisher             = "Canonical"
    offer                 = "0001-com-ubuntu-server-jammy"
    sku                   = "22_04-lts"
    subnet_id = "/subscriptions/70d13209-b5da-483b-9f07-a91b9e1a684b/resourceGroups/todo_rg/providers/Microsoft.Network/virtualNetworks/todo_vnet/subnets/todo_frontendsubnet"
    
  }

  backendvm = {
    vm_name               = "backendvm"
    resource_group_name   = "todo_rg"
    location              = "east us"
    nic_name              = "bkendnic"
    ip_configuration_name = "bkend_ip_config"
    subnet_key            = "backendsubnet"
    publisher             = "Canonical"
    offer                 = "0001-com-ubuntu-server-jammy"
    sku                   = "22_04-lts"
     subnet_id = "/subscriptions/70d13209-b5da-483b-9f07-a91b9e1a684b/resourceGroups/todo_rg/providers/Microsoft.Network/virtualNetworks/todo_vnet/subnets/todo_backendsubnet"
  }

}

nsg_details = {
  frontendnsg = {
    nsg_name            = "todofrontnsg"
    location            = "east us"
    resource_group_name = "todo_rg"
  }
  backendnsg = {
    nsg_name            = "todobacknsg"
    location            = "east us"
    resource_group_name = "todo_rg"
  }
}

nsga_details = {
  frontendnsga = {
    network_interface_id      = "/subscriptions/8b10287d-12d6-41e3-b62c-33457c006e96/resourceGroups/todo_rg/providers/Microsoft.Network/networkInterfaces/frendnic"
    network_security_group_id = "/subscriptions/8b10287d-12d6-41e3-b62c-33457c006e96/resourceGroups/todo_rg/providers/Microsoft.Network/networkSecurityGroups/todofrontnsg"
  }
  backendnsga = {
    network_interface_id      = "/subscriptions/8b10287d-12d6-41e3-b62c-33457c006e96/resourceGroups/todo_rg/providers/Microsoft.Network/networkInterfaces/bkendnic"
    network_security_group_id = "/subscriptions/8b10287d-12d6-41e3-b62c-33457c006e96/resourceGroups/todo_rg/providers/Microsoft.Network/networkSecurityGroups/todobacknsg"
  }

}

sql_servers = {
  mysql = {
    server_name         = "mssqlserver"
    resource_group_name = "todo_rg"
    location            = "east us"
    database_name       = "msdb"
  }
}

subscription_id = "70d13209-b5da-483b-9f07-a91b9e1a684b"
